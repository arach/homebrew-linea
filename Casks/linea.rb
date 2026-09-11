cask "linea" do
  version "0.5.2"
  sha256 "0f8d5e1b0debc5e61c76d915d21eef82502638d5e96b82b0e4c1cec0cd643250"

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
