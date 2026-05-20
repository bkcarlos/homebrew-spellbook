class Spellbook < Formula
  desc "Local-first command vault — your spellbook of shell incantations"
  homepage "https://github.com/bkcarlos/spellbook"
  version "0.1.11"
  license "MIT"

  # ---------------------------------------------------------------------------
  # After each release, run `.github/workflows/release.yml` (push a vX.Y.Z tag),
  # then copy the SHA-256 values from the workflow output into the three
  # `sha256` lines below. Bump `version` to match.
  # ---------------------------------------------------------------------------

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-aarch64-apple-darwin.tar.gz"
      sha256 "3bb8b6ef976465b3e28c1ae9c597d8c99d358dc930de03d39d9c0f5dc31ee097"
    else
      url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-apple-darwin.tar.gz"
      sha256 "ff77adafb69d52c8d9c6f5d2d5abab7ed942f4cd2eb55fd664faefb04302ef41"
    end
  end

  on_linux do
    url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/spellbook-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1885c584295575e8caf0201f0eccac9c3dd2fb16ba409c3264e4701f0d9be4a4"
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
