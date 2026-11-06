class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  license "MIT"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.9.1/hash_v0.9.1_darwin_arm64.tar.gz"
      sha256 "4528e01b051d0b51feb2d3a1a435b0bfd4835bdf6ec921ac90437967c898d809"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.9.1/hash_v0.9.1_darwin_amd64.tar.gz"
      sha256 "073848a089188412c98d6473ff8ea8b381283d931ab6f96dbb85f21a5bdadc10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tfcace/hash/releases/download/v0.9.1/hash_v0.9.1_linux_arm64.tar.gz"
      sha256 "112d904ad0f458dd09dd321ac4ddc2dcc0a0c70bd683938683756d4e24c3022c"
    else
      url "https://github.com/tfcace/hash/releases/download/v0.9.1/hash_v0.9.1_linux_amd64.tar.gz"
      sha256 "ddb328e01164189648a151c32c71792378eb5a11611faaabddd9066a989b43e2"
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
