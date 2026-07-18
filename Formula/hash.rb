class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.7.1/hash_v0.7.1_darwin_arm64.tar.gz"
      sha256 "5688d75cfad4076b39c0243dead852bf2642e260ec6665227e22b85a964899c7"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.7.1/hash_v0.7.1_darwin_amd64.tar.gz"
      sha256 "a3d9df418054993a2d21fa5b48c1025e50b1d73235a4f53d106e3cd28334a69e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.7.1/hash_v0.7.1_linux_arm64.tar.gz"
      sha256 "03eba310564285eaf8b607cc851e1eaab4415d13afedf5828f34c86b519f9d43"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.7.1/hash_v0.7.1_linux_amd64.tar.gz"
      sha256 "87017916ee54d2c5ae9a22881f7bf2857979ca47b62e31e43c3407ee81e8fe84"
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
