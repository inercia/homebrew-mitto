# typed: strict
# frozen_string_literal: true

# Homebrew Cask for Mitto macOS app
cask "mitto" do
  version "0.2.1"

  on_arm do
    sha256 "99f51a9d4c20e83920c42c8143a02c0decb87a8aca039e149d3b70997d7280e9"

    url "https://github.com/inercia/mitto/releases/download/v0.2.1/Mitto-darwin-arm64.zip"
  end
  on_intel do
    sha256 "02008d3c3deaa47d1fd7c942c1f04634a21a35765d6fed09ffe015cf9cda1a67"

    url "https://github.com/inercia/mitto/releases/download/v0.2.1/Mitto-darwin-amd64.zip"
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
