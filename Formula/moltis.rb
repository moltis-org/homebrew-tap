class Moltis < Formula
  desc "Personal AI gateway — one binary, multiple LLM providers"
  homepage "https://docs.molt.bot/"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a081d106883055c83b78ffac240f16883604a8855b2d7fd3ebb555e75f9c0c46"
    else
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1bf0e067bebd9352f51f1fdbfd9739100b8cf5206868599a1ce77d702256192b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d13143f1084177a4c1b54ec7cf0293e79925e96433e81a341ac2c18a10ef3867"
    else
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84378d735a5d123259d17ff4c1ef8c063cb32c3f7b460b9be80807c59e6201d6"
    end
  end

  def install
    bin.install "moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
