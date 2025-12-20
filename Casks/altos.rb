cask "altos" do
  version "1.9.22"
  sha256 "8f4de51426726b06534ab188d5ab41855ca38a060ccc1b0e036caca1fe04c6a6"

  url "https://altusmetrum.org/AltOS/releases/#{version}/Altos-Mac-#{version}.dmg"
  name "altos"
  desc "Rocketry flight monitoring and analysis tool"
  homepage "https://altusmetrum.org/AltOS/"

  livecheck do
    url "https://altusmetrum.org/AltOS/releases/"
    regex(%r{href=["']?1\.9\.([0-9]+)\/["']?}i)
  end

  depends_on macos: ">= :big_sur"

  app "AltosUI.app"

  postflight do
    # Remove the quarantine flag
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/AltosUI.app"],
                   sudo: true
  end

  zap trash: "~/Library/Preferences/org.altusmetrum.altosui.plist"
end
