class Maudebox < Formula
  desc "Sandboxed dev container for Claude Code and other coding agents"
  homepage "https://github.com/martint/maudebox"
  url "https://github.com/martint/maudebox.git", branch: "main"
  head "https://github.com/martint/maudebox.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  def caveats
    <<~EOS
      maudebox drives Docker (25+); install Docker Desktop or OrbStack.
      Build the image from a checkout with: cargo xtask image
    EOS
  end

  test do
    assert_match "maudebox", shell_output("#{bin}/maudebox --help")
  end
end
