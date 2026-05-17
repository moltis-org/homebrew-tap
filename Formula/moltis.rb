class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "20260517.03"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a3c0c1eccaac95756322114804a7a7e18dcf023efdd31421fce074f68b63c7f9"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f742f7187c5eb4e4ca61d548bcb7acf077ba29b997c3af7cd8897aada3278ce4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8af1cff430d5aa7bfa9119464316b26c5254fe01174d14bc7d509f7b2071921"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5eefd8cf5bc419151e32a555a16bfdda899e7af7fccebae5624806ca5dffd2b2"
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
