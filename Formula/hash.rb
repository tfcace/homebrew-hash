class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.10.0/hash_v0.10.0_darwin_arm64.tar.gz"
      sha256 "af6bae79f2176b151ddfa2a822755f961147e4a2780d483b5cfd8a18d873aa1f"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.10.0/hash_v0.10.0_darwin_amd64.tar.gz"
      sha256 "f22b169d9449596e86fd005aa8a517bfb27115e5db6835056ee906d2c31b5391"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.10.0/hash_v0.10.0_linux_arm64.tar.gz"
      sha256 "254b8cf6862a2fc29ea4297bdca65ea5c74a2ce1e9aeb271eba65c5a12b0bb5f"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.10.0/hash_v0.10.0_linux_amd64.tar.gz"
      sha256 "de3059ff3d741a38684f5234126f94680d90dfae750fa3e4d8922a4fcdb1ad7e"
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
