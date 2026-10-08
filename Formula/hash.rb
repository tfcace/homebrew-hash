class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.8.0/hash_v0.8.0_darwin_arm64.tar.gz"
      sha256 "cfd6a5c1ece2c2c8d53753e23e70131d81461d19353bbdf725230b05b2ad2f7c"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.8.0/hash_v0.8.0_darwin_amd64.tar.gz"
      sha256 "30a5b3f366e1f55fecaef2fac4fca252106f4e78116517e0d30883b12eb094b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.8.0/hash_v0.8.0_linux_arm64.tar.gz"
      sha256 "128b4118fef2e186eda99dea88cef83f739a7294a316f0c144593a56f9ba2e91"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.8.0/hash_v0.8.0_linux_amd64.tar.gz"
      sha256 "0c850cfc4a32432d29b523d108df7041b21e0accdd2bd599f3addde86b30afa7"
    end
  end

  def install
    bin.install "hash"
  end

  def caveats
    <<~EOS
      To use hash as your login shell:
        sudo sh -c 'echo #{opt_bin}/hash >> /etc/shells'
        chsh -s #{opt_bin}/hash
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hash --version")
  end
end
