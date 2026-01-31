class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.4.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_darwin_arm64.tar.gz"
      sha256 ""
    else
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_darwin_amd64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_linux_arm64.tar.gz"
      sha256 ""
    else
      url "https://github.com/tfcace/hash/releases/download/v0.4.3/hash_v0.4.3_linux_amd64.tar.gz"
      sha256 ""
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
