cask "openrct2" do
  # NOTE: "2" is not a version number, but an intrinsic part of the product name
  on_sierra :or_older do
    version "0.2.6"
    sha256 "0073933b486da10b181bc8a226a140badc64c7cd93f681d769c17b5715221a85"
    url "https://github.com/OpenRCT2/OpenRCT2/releases/download/v#{version}/OpenRCT2-#{version}-macos-x86_64.zip",
        verified: "github.com/OpenRCT2/OpenRCT2/"
  end
  on_high_sierra do
    version "0.3.4.1"
    sha256 "dbe5f13d2ae391160bcf7cfa80d9a8d7fd5937c12f4dd0dea9254f00038e60c7"
    url "https://github.com/OpenRCT2/OpenRCT2/releases/download/v#{version}/OpenRCT2-#{version}-macos-x86-64.zip",
        verified: "github.com/OpenRCT2/OpenRCT2/"
  end
  on_mojave :or_newer do
    version "0.4.3"
    sha256 "41c03eed5b511acff20d7d7ea1d037b0ac3683b7618904a061df5fe66863e3a3"
    url "https://github.com/OpenRCT2/OpenRCT2/releases/download/v#{version}/OpenRCT2-#{version}-macos-universal.zip",
        verified: "github.com/OpenRCT2/OpenRCT2/"
  end

  name "OpenRCT2"
  desc "Open-source re-implementation of RollerCoaster Tycoon 2"
  homepage "https://openrct2.io/"

  app "OpenRCT2.app"
end
