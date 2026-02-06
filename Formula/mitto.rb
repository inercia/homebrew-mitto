# typed: strict
# frozen_string_literal: true

# Homebrew formula for Mitto - CLI client for the Agent Communication Protocol (ACP)
class Mitto < Formula
  desc "CLI client for the Agent Communication Protocol (ACP)"
  homepage "https://github.com/inercia/mitto"
  version "0.0.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.0.14/mitto-darwin-amd64.tar.gz"
      sha256 "e833593a9355af792c7465081dcad6f6c90814bfe7558be87cfd11243c499695"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.0.14/mitto-darwin-arm64.tar.gz"
      sha256 "ee9c41c603cb9f22173128ebfd064ebb4eda856e2cbc0fec86eed89730acba0f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.0.14/mitto-linux-amd64.tar.gz"
      sha256 "14ce110f1535893eefbf486af323506dba9bd3b1559f8c39743398812802b5d7"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.0.14/mitto-linux-arm64.tar.gz"
      sha256 "a4507e160fe7c17a4f9389a55b60a41ef291e4fcc0731f6a3778b7ae17b4cc01"
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

      Configuration is stored in:
        #{Dir.home}/Library/Application Support/Mitto/

      For more information, visit:
        https://github.com/inercia/mitto
    EOS
  end

  test do
    assert_match "Mitto is a command-line interface", shell_output("#{bin}/mitto --help")
  end
end
