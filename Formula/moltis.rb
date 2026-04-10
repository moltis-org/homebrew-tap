class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "20260410.01"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6503e7f037a16dfe9fb8d8264dd5fdd9dc56dba2ede942bcb95c6aae47b00ab9"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "44ab608178997f529b5628ef314f398e47327caf14517b61d207b26e4080551d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c219739e36988d47112d51432c4314411a7f4675ce01456ba1444c24a3212ff4"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2e43827213337225d5552105560ef6aa1df3d984be2b3bf27eba62fc37cc13a"
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
