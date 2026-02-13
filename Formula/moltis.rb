class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "0.8.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "027e72264faf986e823e3398013fecf36892b4d8687d6d030eb00b730f0b9515"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d17c3c4db9e8d3a8b2ab3ebfdf245e6665a6fe539a2ac7fe0910f64d64b609c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf98eac9c6ae9b30c5f743131d0b750255cf665dcd8013f0fc6eeb96b24ec341"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d0b76e6df0c6872b8ff946ceeec2a8041814937e4e94483c1218f5a4fb50da7"
    end
  end

  def install
    bin.install "moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
