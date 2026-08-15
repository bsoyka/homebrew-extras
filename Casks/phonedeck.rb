cask "phonedeck" do
  version "1.1"
  sha256 "3a8df2e4c85ac351da89a5e67e3e7f3ec57554023f231b25aa57a67d143716f0"

  url "https://phonedeck.io/downloads/PhoneDeck-#{version}.dmg"
  name "PhoneDeck"
  desc "Turns your phone into a wireless controller"
  homepage "https://phonedeck.io/"

  livecheck do
    url "https://phonedeck.io/"
    strategy :page_match
    regex(/PhoneDeck-([\d.]+)\.dmg/i)
  end

  depends_on macos: :sonoma

  app "PhoneDeck.app"
end
