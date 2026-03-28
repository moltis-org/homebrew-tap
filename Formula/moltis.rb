class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "20260328.01"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5ed032bba91dd36dd8589c89ce02f133d20fd7f43debe1eb8608315e9db8f0ee"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "767da4b6aa12fb520775ceafc38403394f186b5be1f87e38e62caf2244dc3d87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43c097f45263f3c55fff2f64d6f9275d80a242371ef2eace2acb74c08116b2a5"
    else
      url "https://github.com/moltis-org/moltis/releases/download/#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77c6abc8714524e89807528c20beed7b0d49894a161c3a114a4d3503dfe2e066"
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
