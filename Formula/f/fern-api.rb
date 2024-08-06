class FernApi < Formula
  desc "Stripe-level SDKs and Docs for your API"
  homepage "https://buildwithfern.com/"
  url "https://registry.npmjs.org/fern-api/-/fern-api-0.37.8.tgz"
  sha256 "c2a09f7e4dc64f3b206e50fdd6d2d2063cfe623bd27994251406590b2aad3f44"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "d2b574e6bcb54735c1c5385255bf5d34bdb1c01bd0b3740a8492880ee9d48945"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/fern init 2>&1", 1)
    assert_match "Login required", output

    assert_match version.to_s, shell_output("#{bin}/fern --version")
  end
end
