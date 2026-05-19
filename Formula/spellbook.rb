class Spellbook < Formula
  desc "Local-first command vault — your spellbook of shell incantations"
  homepage "https://github.com/bkcarlos/spellbook"
  version "0.1.6"
  license "MIT"

  # ---------------------------------------------------------------------------
  # After each release, run `.github/workflows/release.yml` (push a vX.Y.Z tag),
  # then copy the SHA-256 values from the workflow output into the three
  # `sha256` lines below. Bump `version` to match.
  # ---------------------------------------------------------------------------

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-aarch64-apple-darwin.tar.gz"
      sha256 "197a45f9664f8477f1ccb49a963ecf4cc86c5114869716226589ebdf3b493f36"
    else
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-apple-darwin.tar.gz"
      sha256 "57ec409248289df05a48a2793a1914edd2044d5c50f56b15d87762541e212f8c"
    end
  end

  on_linux do
    url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e8810987270025e953a0e3c63566783d4414966f9a9e139dccc8934e342ca6ec"
  end

  def install
    bin.install "spellbook"
  end

  def caveats
    <<~EOS
      Spellbook stores its data in:
        macOS: ~/Library/Application Support/Spellbook/
        Linux: ~/.local/share/Spellbook/

      Launch with:
        spellbook

      Press `?` inside the app to see all keyboard shortcuts.
    EOS
  end

  test do
    assert_predicate bin/"spellbook", :executable?
  end
end
