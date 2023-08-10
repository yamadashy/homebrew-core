class NodeSass < Formula
  require "language/node"

  desc "JavaScript implementation of a Sass compiler"
  homepage "https://github.com/sass/dart-sass"
  url "https://registry.npmjs.org/sass/-/sass-1.65.1.tgz"
  sha256 "cf1b91ec37baadf161f6694759d43b3a641c3fe611fe48fd82bff6cf5b373654"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "5a05866dbfb3b57ff891235ef9218d0c87a5e48423b3e62c4ebd9107646f0038"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5a05866dbfb3b57ff891235ef9218d0c87a5e48423b3e62c4ebd9107646f0038"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "5a05866dbfb3b57ff891235ef9218d0c87a5e48423b3e62c4ebd9107646f0038"
    sha256 cellar: :any_skip_relocation, ventura:        "5a05866dbfb3b57ff891235ef9218d0c87a5e48423b3e62c4ebd9107646f0038"
    sha256 cellar: :any_skip_relocation, monterey:       "5a05866dbfb3b57ff891235ef9218d0c87a5e48423b3e62c4ebd9107646f0038"
    sha256 cellar: :any_skip_relocation, big_sur:        "5a05866dbfb3b57ff891235ef9218d0c87a5e48423b3e62c4ebd9107646f0038"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "fd8746af6a7ba117006e6b47e8351e7a776897fff1a7f332b5ed1057f0af7e69"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.scss").write <<~EOS
      div {
        img {
          border: 0px;
        }
      }
    EOS

    assert_equal "div img{border:0px}",
    shell_output("#{bin}/sass --style=compressed test.scss").strip
  end
end
