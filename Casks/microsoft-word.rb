cask "microsoft-word" do
  on_el_capitan :or_older do
    version "16.16.20101200"
    sha256 "0c61b7db7a6a13653270795c085a909aa54668e8de2f2ca749257ce6aa5957d1"
  end
  on_sierra do
    version "16.30.19101301"
    sha256 "6abd7939b0d935023ebb8fabeb206c4cbbe8eb8f9a3ff7d318448d2ba5f332e4"
  end
  on_high_sierra do
    version "16.43.20110804"
    sha256 "3d957d534fb2142f6e95a688552890a31f0d942796f0128ca837a3e98405d413"
  end
  on_mojave do
    version "16.54.21101001"
    sha256 "7f3ed397b517aac3637d8b8f8b4233f9e7132941f0657eaca8ec423ac068616e"
  end
  on_catalina :or_newer do
    version "16.68.22121100"
    sha256 "2eb51e0c1ab59df6fbc0362a4dae20346abb1cd8d4a92fa27984b66e79fd8290"
  end

  url "https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_#{version}_Installer.pkg",
      verified: "officecdnmac.microsoft.com/"
  name "Microsoft Word"
  desc "Word processor"
  homepage "https://products.office.com/en-US/word"

  livecheck do
    url "https://go.microsoft.com/fwlink/p/?linkid=525134"
    strategy :header_match
  end

  auto_updates true
  conflicts_with cask: "microsoft-office"
  depends_on cask: "microsoft-auto-update"

  pkg "Microsoft_Word_#{version}_Installer.pkg",
      choices: [
        {
          "choiceIdentifier" => "com.microsoft.autoupdate", # Office16_all_autoupdate.pkg
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
      ]

  uninstall pkgutil:   [
              "com.microsoft.package.Microsoft_Word.app",
              "com.microsoft.pkg.licensing",
            ],
            launchctl: "com.microsoft.office.licensingV2.helper",
            quit:      "com.microsoft.autoupdate2"

  zap trash: [
    "~/Library/Application Scripts/com.microsoft.Word",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.microsoft.word.sfl*",
    "~/Library/Application Support/CrashReporter/Microsoft Word_*.plist",
    "~/Library/Containers/com.microsoft.Word",
    "~/Library/Preferences/com.microsoft.Word.plist",
    "~/Library/Saved Application State/com.microsoft.Word.savedState",
  ]
end
