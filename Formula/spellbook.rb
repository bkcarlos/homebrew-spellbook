class Spellbook < Formula
  desc "Local-first command vault — your spellbook of shell incantations"
  homepage "https://github.com/bkcarlos/spellbook"
  version "0.1.7"
  license "MIT"

  # ---------------------------------------------------------------------------
  # After each release, run `.github/workflows/release.yml` (push a vX.Y.Z tag),
  # then copy the SHA-256 values from the workflow output into the three
  # `sha256` lines below. Bump `version` to match.
  # ---------------------------------------------------------------------------

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-aarch64-apple-darwin.tar.gz"
      sha256 "b476b00aaf6951a7557708cf3c1c3f82ff36f12ebf086b0f50036afd866318cd"
    else
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-apple-darwin.tar.gz"
      sha256 "1f5c57418575c44978635e74e1f9331458ab8fdadeb9e5d64c7eb8e80e8a6949"
    end
  end

  on_linux do
    url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "76e520f4894ee9bc92106d9078bdffae5a5ecd5e149f781337f0af49807fd11e"
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
