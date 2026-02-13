# typed: strict
# frozen_string_literal: true

# Homebrew Cask for Mitto macOS app
cask "mitto" do
  version "0.1.0"

  on_arm do
    sha256 "dcb7bdfbad3da85ce9e49d4e7ec3937804e92b61d117026d60b8258287124f52"

    url "https://github.com/inercia/mitto/releases/download/v0.1.0/Mitto-darwin-arm64.zip"
  end
  on_intel do
    sha256 "d5797db81885c75ad84208c4f5584dd78f38ae5d9893f2d0f23116494c991e08"

    url "https://github.com/inercia/mitto/releases/download/v0.1.0/Mitto-darwin-amd64.zip"
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
