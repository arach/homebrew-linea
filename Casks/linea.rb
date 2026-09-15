cask "linea" do
  version "0.5.3"
  sha256 "275dd7c5633acd67b5187feabbe844a169d0d1aed23149f00791a8a02da8e20d"

  url "https://download.uselinea.com/mac/versions/#{version}/Linea.dmg"
  name "Linea"
  desc "Reading workspace where text becomes audio and highlights become conversations"
  homepage "https://www.uselinea.com"

  livecheck do
    url "https://download.uselinea.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :sonoma

  preflight do
    target = cask.config.appdir.join("Linea.app")
    if target.exist?
      opoo "Existing Linea.app found at #{target}; updating automagically."
      begin
        FileUtils.rm_rf(target)
      rescue
        system_command "/bin/rm", args: ["-rf", target.to_s], sudo: true
      end
    end
  end

  app "Linea.app"

  caveats <<~EOS
    To upgrade Linea in the future:
      brew upgrade --cask linea
  EOS

  zap trash: [
    "~/Library/Application Support/com.uselinea.mac",
    "~/Library/Application Support/Linea",
    "~/Library/Caches/com.uselinea.mac",
    "~/Library/Preferences/com.uselinea.mac.plist",
    "~/Library/Saved Application State/com.uselinea.mac.savedState",
  ]
end
