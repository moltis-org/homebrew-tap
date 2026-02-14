class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "0.8.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "dde820e32b98ef9e14588514fd168683de4bb1c255c3ec15a9072a97ebc80658"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d40932fb59a52284a1d0d0bd095f0861e3ca235df847145f6ae4bdcbd9c93789"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b9a45da4a8a20b056e1599c6c46b69fd118c29fc044a7f0342c1f37068dda69"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6ff97a8681dbe69fe361f90a0d14381dabb61485bc520b19dacf1ced2f7d69f"
    end
  end

  def install
    bin.install "moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
