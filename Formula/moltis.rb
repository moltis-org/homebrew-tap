class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "0.8.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "18a00633580b5b46b50f459ef270f2c000d8bcfe83ab097b196b6aa5b630dea1"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4a67397256aa236734493cea8a37a68035bac839cb2ebb53c75d594610212402"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "006da3324c92053b4a3c66c102c0608a3752ffbe60bc47d1eab63df03cc83d9a"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd41b9c2c2ef601200fcfb69b5230fddaa961a5a6b27d509cf4f189cbd865a6e"
    end
  end

  def install
    bin.install "moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
