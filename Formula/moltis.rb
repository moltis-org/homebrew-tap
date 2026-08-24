class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "20260824.01"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "396f710e7b4e54806bc4cbbe2d2148b726de2a4c3a415c8472c755cbbc0a6250"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8c6856c7348598bdf15a75d33cbe478cf66d6ef75482ddd0ccde2742566ad308"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bd3efca419aaa73e2f93840866f93621e0983cf8898e6863164c916e25d8808"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6d34dc6f2b8e6d122c02f39b3ee73a028ebf92897787819767b481de15c89b8"
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
