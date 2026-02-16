# typed: strict
# frozen_string_literal: true

# Homebrew formula for Mitto - CLI client for the Agent Communication Protocol (ACP)
class Mitto < Formula
  desc "CLI client for the Agent Communication Protocol (ACP)"
  homepage "https://github.com/inercia/mitto"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.2.0/mitto-darwin-amd64.tar.gz"
      sha256 "d86d61c975186afdda150ea631380f636cac4447703549617f6cbdfe25466a5f"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.2.0/mitto-darwin-arm64.tar.gz"
      sha256 "2c6677701616e8f47ddbb04f953b7f77a5cf9a8b12dca8163d9ae6469e75f35d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.2.0/mitto-linux-amd64.tar.gz"
      sha256 "a5d0df1c5657f438d20a36b6d93cee639dfb89726b8ebe457902bf996c0366ca"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.2.0/mitto-linux-arm64.tar.gz"
      sha256 "0a30a8072724061b698c1680609f1ccdc9cd26dc04ff4954935e300cb0c52a13"
    end
  end

  def install
    bin.install "mitto"
  end

  def caveats
    <<~EOS
      Mitto requires an ACP server to be installed and configured.
      
      Supported ACP servers:
        - Auggie (auggie)
        - Claude Code (claude-code)
      
      Quick start:
        1. Run: mitto web
        2. Open: http://localhost:8080
      
      Or use the CLI:
        mitto cli
      
      For more information, visit:
        https://github.com/inercia/mitto
    EOS
  end

  test do
    assert_match "Mitto is a command-line interface", shell_output("#{bin}/mitto --help")
  end
end
