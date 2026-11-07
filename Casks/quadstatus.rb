cask "quadstatus" do
  version "1.0.0"
  sha256 "fb23dacb9beb472bb31529e97aae0d5a9a58e9d6fd7ef73147948c9f0c3d6f90"

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
