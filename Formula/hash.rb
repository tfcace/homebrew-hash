class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.6.0/hash_v0.6.0_darwin_arm64.tar.gz"
      sha256 "1d1c39d9983782a4f4594a84e6926233dc5268128b6bb24f16d0528f886e304b"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.6.0/hash_v0.6.0_darwin_amd64.tar.gz"
      sha256 "6fe2c0661c22b462cd4bbf409447b79115414b08d285218375e4401f1699c351"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.6.0/hash_v0.6.0_linux_arm64.tar.gz"
      sha256 "26289a46fb4e775c4969d9a7c22b5d92b68232a4bb2e8555d3f70167da96ee16"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.6.0/hash_v0.6.0_linux_amd64.tar.gz"
      sha256 "f2c3fcc6db44dd8077231854f4792f46bfa98835ac61ca9100372e90cf67fe5e"
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
