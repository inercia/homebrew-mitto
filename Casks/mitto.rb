# typed: strict
# frozen_string_literal: true

# Homebrew Cask for Mitto macOS app
cask "mitto" do
  version "0.3.0"

  on_arm do
    sha256 "589d75618286ea17a05e933b93b6863f3d8aa6af21e4f1c9af0c383f33429a2b"

    url "https://github.com/inercia/mitto/releases/download/v0.3.0/Mitto-darwin-arm64.zip"
  end
  on_intel do
    sha256 "bf9a55d04d8abf2e57f5decc150f7fed3a01ee5e71ab8863d0c3360d61ea72a7"

    url "https://github.com/inercia/mitto/releases/download/v0.3.0/Mitto-darwin-amd64.zip"
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
