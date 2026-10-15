cask "unixcmd-agent" do
  version "0.2.0"
  sha256 "30f59beff5cf48c1d1fb21fd16f7f449ce8f03cbcd42f5edde64295f77133bad"

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
