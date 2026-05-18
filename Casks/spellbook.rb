cask "spellbook" do
  version "0.1.0"
  sha256 "d659d65552d0c19cf4edf9a93461e3367c677dad48102df4c9184debf04cc272"

  url "https://github.com/bkcarlos/spellbook/releases/download/v#{version}/Spellbook-#{version}.dmg"
  name "Spellbook"
  desc "Local-first command vault — your spellbook of shell incantations"
  homepage "https://github.com/bkcarlos/spellbook"

  # ---------------------------------------------------------------------------
  # After each release, scripts/patch_cask.sh (or CI's publish-tap job)
  # downloads Spellbook-X.Y.Z.dmg, computes SHA-256, and replaces the
  # placeholder above + bumps the version string.
  # ---------------------------------------------------------------------------

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Spellbook.app"

  zap trash: [
    "~/Library/Application Support/Spellbook",
    "~/Library/Caches/Spellbook",
    "~/.config/Spellbook",
  ]
end
