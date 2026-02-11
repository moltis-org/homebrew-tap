class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "0.8.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "32c20c75a5ca813d88dca8a52b7b90d2b19d8ce644f32c39888bb4afe4f3e20c"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d5e975b50c32fb2adb3aaad7520d962c017ef9561be4f36ad5c25ccad6d81c8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60f1ed0cbb39fe3bd5785f1c2e32ba1dd5db05c1896d3b3700a0ddada5b91006"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64728d9c8c4133586f2f8887d9a28cde081123aabafad9cc243728e34ea81655"
    end
  end

  def install
    bin.install "moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
