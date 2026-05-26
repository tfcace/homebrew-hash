class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.5.0/hash_v0.5.0_darwin_arm64.tar.gz"
      sha256 "5b0d4a4a9b0a8caaa96b1e9616e5382e08727d1e65942e022f8550ff15523508"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.5.0/hash_v0.5.0_darwin_amd64.tar.gz"
      sha256 "ffcfd27e69d6a6f2d1ffb2408cad01fdc0d8f2c1e8ae6568a87956ac2668a996"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.5.0/hash_v0.5.0_linux_arm64.tar.gz"
      sha256 "1c0ee506ea108e164e66ec8407e5e3e0257195ec7c1f1f36baffd112dd8f2707"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.5.0/hash_v0.5.0_linux_amd64.tar.gz"
      sha256 "fcec93817afb61efadab9a0cccdb229e985f11b9a4f019193e42b3d7841757a6"
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
