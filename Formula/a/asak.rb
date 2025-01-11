class Asak < Formula
  desc "Cross-platform audio recording/playback CLI tool with TUI"
  homepage "https://github.com/chaosprint/asak"
  url "https://github.com/chaosprint/asak/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "da90a31924a6ac7ed06fa54d5060290535afdfe1a6fc3e69ad1ed5bc82757e92"
  license "MIT"
  head "https://github.com/chaosprint/asak.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "27f85372d811d595deb8fe3c4109b6f21e994239cc42960f20feef6f36cbe4a0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b351b44a345d7365a2db6bb171c329ff60a5dca881e149fc69c0374ca573de71"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "cb3ba1659b7ea8362939a894ed18d39e9bee1c1fb322a44486e9ceebbeff24c7"
    sha256 cellar: :any_skip_relocation, sonoma:        "1f62eda3c07127c794a1ffe34fd94c3903bcdcfb7fdfe86d1a2e44655ae49c94"
    sha256 cellar: :any_skip_relocation, ventura:       "1f73391abd8d6f38c3d39815ba4927cf62bd12b96db82d070dd420784379df52"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0334dca2e8a77f943f4fc0bfb43b540c7ae9c76452685df22bdbf1e049cee40c"
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "jack"

  on_linux do
    depends_on "alsa-lib"
  end

  def install
    system "cargo", "install", *std_cargo_args

    bash_completion.install "target/completions/asak.bash" => "asak"
    fish_completion.install "target/completions/asak.fish" => "asak"
    zsh_completion.install "target/completions/_asak" => "_asak"
    man1.install "target/man/asak.1"
  end

  test do
    output = shell_output("#{bin}/asak play")
    assert_match "No wav files found in current directory", output

    assert_match version.to_s, shell_output("#{bin}/asak --version")
  end
end
