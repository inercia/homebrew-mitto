# typed: strict
# frozen_string_literal: true

# Homebrew formula for Mitto - CLI client for the Agent Communication Protocol (ACP)
class Mitto < Formula
  desc "CLI client for the Agent Communication Protocol (ACP)"
  homepage "https://github.com/inercia/mitto"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.3.0/mitto-darwin-amd64.tar.gz"
      sha256 "54b9b0284a2a4dc9e874283574ecc27fbd91cb488d6ebdc4ff420dc5108f6675"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.3.0/mitto-darwin-arm64.tar.gz"
      sha256 "a97e02c234bd0cc727a7fa323cb5de5e7a80fb15b6645df9f5f463838941923b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.3.0/mitto-linux-amd64.tar.gz"
      sha256 "cbb509a9f6511f8f96b0d5ffac89e329b75017686f2b5fe38230c31a46b7f8f7"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.3.0/mitto-linux-arm64.tar.gz"
      sha256 "5e9d199c56fb887d731ec1a3b0f8868bd1dd1a603f4498e1a5340cc73571dcea"
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
