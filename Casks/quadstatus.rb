cask "quadstatus" do
  version "1.0.0"
  sha256 "03d7d0f9bf4c95d3462090a867e4cb8458ece2c062a7c29bbd7a9a4e1ff062a9"

  url "https://github.com/chocholous/QuadStatus/releases/download/v#{version}/QuadStatus-#{version}.dmg"
  name "QuadStatus"
  desc "Battery, volume, network and keyboard layout in one menu bar badge"
  homepage "https://github.com/chocholous/QuadStatus"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "QuadStatus.app"

  uninstall launchctl: "io.github.chocholous.quadstatus.login",
            quit:      "io.github.chocholous.quadstatus"

  zap trash: [
    "~/Library/LaunchAgents/io.github.chocholous.quadstatus.login.plist",
    "~/Library/Preferences/io.github.chocholous.quadstatus.plist",
  ]

  caveats <<~EOS
    QuadStatus is not yet signed with an Apple Developer ID or notarized, so macOS
    blocks its first launch. Open it once, then allow it in
      System Settings → Privacy & Security → Open Anyway

    To start it at login, turn on "Open at Login" in its menu.
  EOS
end
