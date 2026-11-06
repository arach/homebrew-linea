cask "linea" do
  version "0.9.0"
  sha256 "cc9123ac7196a85c928b47a361173d7062c962feacdaa30c7c5bf79baab761c3"

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
