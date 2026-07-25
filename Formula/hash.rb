class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.7.2/hash_v0.7.2_darwin_arm64.tar.gz"
      sha256 "db4fbb090267dfa0f8783cf725dff8f646df75069a33c241a4d9ea8f494055fb"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.7.2/hash_v0.7.2_darwin_amd64.tar.gz"
      sha256 "1ea028a86e43df2ddb62d31ffe5db0b24168d1d045d7496c1b3c107368488b14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.7.2/hash_v0.7.2_linux_arm64.tar.gz"
      sha256 "e706e7336fcbf32abb0a8f6d18cda77f5c2253bf6417cca230d9fb2e8ae1d5e9"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.7.2/hash_v0.7.2_linux_amd64.tar.gz"
      sha256 "ee75db684a6a2bbdfdccc5d2024c786459ce7c53d33f423578ffa4dfa9a28299"
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
