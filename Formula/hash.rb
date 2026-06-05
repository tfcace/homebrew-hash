class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.5.1/hash_v0.5.1_darwin_arm64.tar.gz"
      sha256 "775b861553677d931ba72a87d2ae7f40178fc4e9c4e75a82530336a8727a91d3"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.5.1/hash_v0.5.1_darwin_amd64.tar.gz"
      sha256 "b0dfedec148be08a6c6fb3dc8c3a9a9c9a0e34f8ba2688aa1064b463709e5cdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.5.1/hash_v0.5.1_linux_arm64.tar.gz"
      sha256 "b26137b50cb21d1be3aa319cd987f2354b78b28be6935ab7b15e463967270477"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.5.1/hash_v0.5.1_linux_amd64.tar.gz"
      sha256 "52adde2086956e4af5f0bfa60ec40d99c53bf8e64872dd743b37ef6d7a816623"
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
