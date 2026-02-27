class Lettie < Formula
  desc "Search Rightmove listings from your terminal"
  homepage "https://lettie.uk"
  url "https://github.com/john-ds-mc/lettie-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c783faf6e9a7e158e7ab84a87f8c561b80e582200db4dcc6fb374bdee535b821"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: false)
    system "npm", "run", "build"
    libexec.install Dir["dist/*"]
    (bin/"lettie").write_env_script libexec/"index.js", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_match "Search Rightmove", shell_output("#{bin}/lettie --help")
  end
end
