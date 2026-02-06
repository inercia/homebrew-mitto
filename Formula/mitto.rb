# typed: strict
# frozen_string_literal: true

# Homebrew formula for Mitto - CLI client for the Agent Communication Protocol (ACP)
class Mitto < Formula
  desc "CLI client for the Agent Communication Protocol (ACP)"
  homepage "https://github.com/inercia/mitto"
  version "0.0.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.0.15/mitto-darwin-amd64.tar.gz"
      sha256 "cbf944c73e401d6ef9794866816ea38e29beb4cda1ca636630301f9af927f86b"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.0.15/mitto-darwin-arm64.tar.gz"
      sha256 "cb5d3c7db67e18bacd530518a0cb61a4905817fdfe2d7b69e7f90abe168888fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.0.15/mitto-linux-amd64.tar.gz"
      sha256 "5ef5faea4cb9578914f926a86f9c6f6d39dcf56a7af9184cb318b566404bbdf3"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.0.15/mitto-linux-arm64.tar.gz"
      sha256 "e308e1c81f9d5bea45d5d017f96db370441addfbda06795a71fe885fac02a94e"
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
