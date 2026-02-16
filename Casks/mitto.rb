# typed: strict
# frozen_string_literal: true

# Homebrew Cask for Mitto macOS app
cask "mitto" do
  version "0.2.0"

  on_arm do
    sha256 "7a6b8f4044024a5ecd67970d7f283e0b0180ab18c44531f87b96b2deca6422ff"

    url "https://github.com/inercia/mitto/releases/download/v0.2.0/Mitto-darwin-arm64.zip"
  end
  on_intel do
    sha256 "4c2040de6416df06b2d180d0e6c9d89180aec2abbb36f7fadc2a46a217dff4ef"

    url "https://github.com/inercia/mitto/releases/download/v0.2.0/Mitto-darwin-amd64.zip"
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
