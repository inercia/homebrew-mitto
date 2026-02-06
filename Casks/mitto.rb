# typed: strict
# frozen_string_literal: true

# Homebrew Cask for Mitto macOS app
cask "mitto" do
  version "0.0.15"

  on_arm do
    sha256 "758775ae58b2f36c303e97cec0dd0929a52ef990292219b483ac881260388538"

    url "https://github.com/inercia/mitto/releases/download/v0.0.15/Mitto-darwin-arm64.zip"
  end
  on_intel do
    sha256 "7b2fc9b4cc54b5a3d09f7da5b87268dca0e1d30b521adb49c83bf77ae495d595"

    url "https://github.com/inercia/mitto/releases/download/v0.0.15/Mitto-darwin-amd64.zip"
  end

  name "Mitto"
  desc "Desktop client for the Agent Communication Protocol (ACP)"
  homepage "https://github.com/inercia/mitto"

  depends_on formula: "mitto"

  app "Mitto.app"

  zap trash: [
    "~/Library/Application Support/Mitto",
    "~/Library/Caches/io.github.inercia.mitto",
    "~/Library/Preferences/io.github.inercia.mitto.plist",
  ]

  caveats <<~EOS
    Mitto.app provides a native macOS interface for ACP communication.

    The CLI tool is also installed and available as 'mitto'.

    For more information, visit:
      https://github.com/inercia/mitto
  EOS
end
