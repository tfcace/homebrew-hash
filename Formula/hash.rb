class Hash < Formula
  desc "AI-powered shell with ACP integration"
  homepage "https://github.com/tfcace/hash"
  url "https://github.com/tfcace/hash/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "5b4686675b0355ff6f1f77a8af085157d56b6ab833d2b02ff8ae0f505484cc01"
  license "MIT"

  depends_on "go" => :build

  def install
    commit = `git rev-parse --short HEAD`.strip
    ldflags = %W[
      -X github.com/tfcace/hash/internal/version.Version=#{version}
      -X github.com/tfcace/hash/internal/version.GitCommit=#{commit}
      -X github.com/tfcace/hash/internal/version.JjChange=unknown
      -X github.com/tfcace/hash/internal/version.BuildDate=#{Time.now.utc.strftime("%Y-%m-%d")}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/hash"
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
