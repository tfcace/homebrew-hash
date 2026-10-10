class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.9.0/hash_v0.9.0_darwin_arm64.tar.gz"
      sha256 "a2ae7c4ca3f48308f89fc2e7fc5df004aa5a6bf268fef778bbe2ae7506b5b96b"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.9.0/hash_v0.9.0_darwin_amd64.tar.gz"
      sha256 "1f4415c59a09c33e2f80fd1b1d551d6d1e986982ab21cb753a65f10c187c3259"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.9.0/hash_v0.9.0_linux_arm64.tar.gz"
      sha256 "d132f34765a9737b0e06fa45e7e1d9c81bf18af7f23b2d3c3b1a23587df80561"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.9.0/hash_v0.9.0_linux_amd64.tar.gz"
      sha256 "cd49c732d1a06d0d41e1bd143144d1ce2cb7e07020b90224081c9930576e2b46"
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
