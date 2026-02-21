class Moltis < Formula
  desc "Personal AI gateway - one binary, multiple LLM providers"
  homepage "https://www.moltis.org/"
  license "MIT"
  version "0.9.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "59a82fec99b784b5d6eb23a37f9fbeb1f61d6b424988988be5acecaa6426ed03"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "21ecbe5d67801011b969361846358c3ecfb873fa8122258166747e581af39a8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "493d4efc7896e9d4a74c4bc283093e7fa3c455ac5579d9747ab550e109b9443d"
    else
      url "https://github.com/moltis-org/moltis/releases/download/v#{version}/moltis-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8bad538cd3f8fe0f7035699d6e164bc4711dcdd110198ac3e545f58354698d5"
    end
  end

  def install
    bin.install "moltis"
  end

  test do
    assert_match "moltis", shell_output("#{bin}/moltis --version")
  end
end
