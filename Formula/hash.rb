class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.7.0/hash_v0.7.0_darwin_arm64.tar.gz"
      sha256 "800d5e238d4306af5b344fa2de7b198d3f273279af2a5d99040f27e35624710f"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.7.0/hash_v0.7.0_darwin_amd64.tar.gz"
      sha256 "786cc330fe41cfd78ac6bc4b582fbdc6f107e5fc14b147a9f443d0254e2b5ae9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.7.0/hash_v0.7.0_linux_arm64.tar.gz"
      sha256 "7fa5eb6bdd58e2ca8c34f22101c9cdeada4366f50829e65975752ddc8156f9c2"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.7.0/hash_v0.7.0_linux_amd64.tar.gz"
      sha256 "52120144157fbdb41c2a995e505964225fa697983fd6c3943e9919efc074cbfc"
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
