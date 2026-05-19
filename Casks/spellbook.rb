cask "spellbook" do
  version "0.1.3"
  sha256 "51e1575473ce10c450fc6c1da1eb4834320a04d8e8697147077e540352f708cd"

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

  # Spellbook isn't notarized with an Apple Developer ID (would cost
  # $99/yr), so Homebrew's default quarantine attribute would trigger
  # Gatekeeper's "cannot verify developer" warning on first launch.
  # The binary IS ad-hoc signed (rust linker does that for arm64 macOS),
  # so once quarantine is removed it launches fine.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Spellbook.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Spellbook",
    "~/Library/Caches/Spellbook",
    "~/.config/Spellbook",
  ]
end
