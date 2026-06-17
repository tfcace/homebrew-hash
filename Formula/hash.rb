class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.6.1/hash_v0.6.1_darwin_arm64.tar.gz"
      sha256 "b096542c8dd13d4b87ade9a7429487eb78d20dd1b09f7c11d2dcbde5c3121233"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.6.1/hash_v0.6.1_darwin_amd64.tar.gz"
      sha256 "9819fa539a8500354315fb2e37dbc664536da0a817e18fd045ff30d08ea97d88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.6.1/hash_v0.6.1_linux_arm64.tar.gz"
      sha256 "ed710350c2545048b8993167ad9a8803d1cfcb82e00e07e2ffdeddb971fbdc72"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.6.1/hash_v0.6.1_linux_amd64.tar.gz"
      sha256 "47798404dc0a900b8e537a4a45b13436e7f901a1b2f375676222b99c444f4ab8"
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
