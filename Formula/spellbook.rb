class Spellbook < Formula
  desc "Local-first command vault — your spellbook of shell incantations"
  homepage "https://github.com/bkcarlos/spellbook"
  version "0.1.4"
  license "MIT"

  # ---------------------------------------------------------------------------
  # After each release, run `.github/workflows/release.yml` (push a vX.Y.Z tag),
  # then copy the SHA-256 values from the workflow output into the three
  # `sha256` lines below. Bump `version` to match.
  # ---------------------------------------------------------------------------

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-aarch64-apple-darwin.tar.gz"
      sha256 "93168c69cb9baa648a1da5a258803673940edbc36e77bed00956b8cdd0745dac"
    else
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-apple-darwin.tar.gz"
      sha256 "b1fedfd8b4cfdcc98719f5064b6c037d935319c40996469dd0c092db99dd376c"
    end
  end

  on_linux do
    url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5a41363c07538af307b056f8c95b18117158471191e5e956f05c67973b076779"
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
