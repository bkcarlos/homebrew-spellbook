cask "spellbook" do
  version "0.1.6"
  sha256 "523305e461fa9a9cbab574569b6adb11b6e7733d21b64baa7eb60b640dc9eb1c"

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
