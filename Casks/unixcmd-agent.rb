cask "unixcmd-agent" do
  version "0.1.0"
  sha256 "6db5202d29a4138a21fdfacead3af592f23d53ae8274aa2b18ce1898c78a1267"

  url "https://github.com/unixcmd/homebrew-tap/releases/download/v#{version}/unixcmd-agent-#{version}.pkg"
  name "UnixCMD agent"
  desc "UnixCMD on this machine: its files, its screen and its editor, given out to a browser"
  homepage "https://unixcmd.noo.bar/"

  pkg "unixcmd-agent-#{version}.pkg"

  uninstall launchctl: ["app.unixcmd.agent.macos", "app.unixcmd.traytool.macos"],
            pkgutil:   "app.unixcmd.agent.macos"

  # The cloud and the machine's token outlive an uninstall on purpose, so that
  # the next version finds the machine still joined. This takes them too.
  zap trash: "~/.config/unixcmd"
end
