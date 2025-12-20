cask "huggle" do
  arch arm: "arm", intel: "intel"

  version "3.4.14"
  sha256 arm:   "508b3cf226fdc2e0104677127c60db7ac3bc81b998198bbd057513a9a15a023f",
         intel: "f4811ca030d3142d1ac643fbefe3ae1fe73aeb586dd4dce4e2c35fc20c2f6b58"

  url "https://github.com/huggle/huggle3-qt-lx/releases/download/#{version}/huggle_#{version}_#{arch}.dmg",
      verified: "github.com/huggle/huggle3-qt-lx/"
  name "Huggle"
  desc "Anti-vandalism tool for Wikimedia projects"
  homepage "https://en.wikipedia.org/wiki/Wikipedia:Huggle"

  livecheck do
    url "https://github.com/huggle/huggle3-qt-lx"
    strategy :git
  end

  depends_on macos: ">= :big_sur"

  app "Huggle.app"

  postflight do
    # Remove the quarantine flag
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Huggle.app"],
                   sudo: true
  end
end
