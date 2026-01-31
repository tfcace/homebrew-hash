class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.4.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_darwin_arm64_v8.0.tar.gz"
      sha256 "3071bab901060e47b3673948247e8cf8ed3c36d69b8b50558b1eaca96fd1d98c"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_darwin_amd64_v1.tar.gz"
      sha256 "357ad6349c337569d89419df3bda714fb9217f99777717c7d91c1ebf2f8e6cb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_linux_arm64_v8.0.tar.gz"
      sha256 "ae3ff4186a1d2dcb4c18665e73a2729364e0c7b2763a2b3b763ce173bd7558c2"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_linux_amd64_v1.tar.gz"
      sha256 "968d2f72a1bfb9cf33e97dfc1d464a2f1363f95ad9e3bbc182b9e98ce1d0e064"
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
