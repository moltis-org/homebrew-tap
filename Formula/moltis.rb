class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "20260818.08"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5a9e739d8b30e3433c2dd046eb825b710649afdf08e0e9a59b717f526c1c6290"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "777fd7588819d3e2faeb6870a1f3b7948d3be819bb85b1454bf51c90f5547c6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9fd665398e24ca76e42b833a52dbfdba43a597e6fc83b3437f07f31810341d1a"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da297e232561437519f727927564cf3ee0e29b2fb6e263977bfdee37f43936a9"
    end
  end

  def install
    libexec.install "moltis"
    share.install "share/moltis"
    (bin/"moltis").write_env_script libexec/"moltis", MOLTIS_SHARE_DIR: share/"moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
