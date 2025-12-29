cask "across-lite" do
  version "2509"
  sha256 "d3a7c4f30c014209ad1920da876264f595598fe0f0da4d59c65fcd4157976b57"

  url "https://www.litsoft.com/across/alite/download/download.php/al#{version}macos.dmg?os=macosx"
  name "across-lite"
  desc "Crossword solver tool"
  homepage "https://www.litsoft.com/across/alite/download/index.html"

  livecheck do
    url "https://www.litsoft.com/across/alite/download/index.html"
    strategy :page_match
    regex(/Mac \(OS 11\.x Big Sur to 10\.14 Mojave\).*?Last update:.*?v\d+(?:\.\d+)*\s*\((\d+)\)/im)
  end

  depends_on macos: ">= :big_sur"

  app "Across Lite.app"
end
