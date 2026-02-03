class Moltis < Formula
  desc "Personal AI gateway — one binary, multiple LLM providers"
  homepage "https://docs.molt.bot/"
  license "MIT"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cc545eaf71b981482101e29cdb034ffc5bc738540177bfc037d2b2d9b59bec4a"
    else
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6ddc812c0a0dae854b3eeda227cd8b49a89f470858edf5ba08828e48cc8e2770"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aadb57abfee1c10621b2259e8a28526afa514589345a391d0539e6b3ed336599"
    else
      url "https://github.com/penso/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f99bdac28c1a344b71792cb185041610242c3c6cba6d6bbf385a5478d18ec42"
    end
  end

  def install
    bin.install "moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
