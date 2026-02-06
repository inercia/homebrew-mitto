# typed: strict
# frozen_string_literal: true

# Homebrew Cask for Mitto macOS app
cask "mitto" do
  version "0.0.14"

  on_arm do
    sha256 "455a59434c49be1828ab30a89f61980c27060ffccf2cfc24842887727955a292"

    url "https://github.com/inercia/mitto/releases/download/v0.0.14/Mitto-darwin-arm64.zip"
  end
  on_intel do
    sha256 "7ae7b47792e95ab40aa19a4bfb4aefcf043a3c0cb3d67ebe4ea2c689a6331324"

    url "https://github.com/inercia/mitto/releases/download/v0.0.14/Mitto-darwin-amd64.zip"
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

    Supported ACP servers:
      - Auggie (auggie)
      - Claude Code (claude-code)

    For more information, visit:
      https://github.com/inercia/mitto
  EOS
end
