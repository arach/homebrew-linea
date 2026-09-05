cask "linea" do
  version "0.5.0"
  sha256 "46786e0c74f50fdefa44e4fcf775400a998bf9a4724aac7bcabacb0f72a003ad"

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

  auto_updates true
  depends_on macos: :sonoma

  app "Linea.app"

  caveats <<~EOS
    If Linea is already installed on your Mac, adopt it with:
      brew install --cask --adopt arach/linea/linea

    To force overwrite an unmanaged installation:
      brew install --cask --force arach/linea/linea

    To upgrade an existing installation:
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
