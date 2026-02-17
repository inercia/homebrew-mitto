# typed: strict
# frozen_string_literal: true

# Homebrew formula for Mitto - CLI client for the Agent Communication Protocol (ACP)
class Mitto < Formula
  desc "CLI client for the Agent Communication Protocol (ACP)"
  homepage "https://github.com/inercia/mitto"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.2.1/mitto-darwin-amd64.tar.gz"
      sha256 "066277318e02df945915f68458a5df2865c96b1b0405647fcfc5cb6eb9aa2564"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.2.1/mitto-darwin-arm64.tar.gz"
      sha256 "88cbb68cd4bf8e014244580b18df9ed42cec10cfdd844f308b66bf86677705f1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/inercia/mitto/releases/download/v0.2.1/mitto-linux-amd64.tar.gz"
      sha256 "df515daf6635b02fc2551b3348a80757a5b950b99299df38264f92835c468843"
    else
      url "https://github.com/inercia/mitto/releases/download/v0.2.1/mitto-linux-arm64.tar.gz"
      sha256 "27a15c8fe7c5663d29501ddc8c73fc9cc4485f886489ebda7c2f751cd3835eba"
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
