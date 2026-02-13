# typed: strict
# frozen_string_literal: true

# Homebrew formula for Mitto - CLI client for the Agent Communication Protocol (ACP)
class Mitto < Formula
  desc "CLI client for the Agent Communication Protocol (ACP)"
  homepage "https://github.com/inercia/mitto"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.1.0/mitto-darwin-amd64.tar.gz"
      sha256 "0327ec49609e7d0ae57be97cdfaf0102f202c1c6e12e1a14fbfeb5a72e1f5ed6"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.1.0/mitto-darwin-arm64.tar.gz"
      sha256 "cc52d47b0e3d99ee1d4404c968317dd300e071468d5f1c4fc5fe6c2cf5c771da"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.1.0/mitto-linux-amd64.tar.gz"
      sha256 "5b14d203e7eeae837e6b9993cd3e109884108f6603872fc12d0f28a79c384908"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.1.0/mitto-linux-arm64.tar.gz"
      sha256 "b30d628d5f448b539ee3607dfefa13c8f93aae1afa6f83138b6bf74f1af13a7d"
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
