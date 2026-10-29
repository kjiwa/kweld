# Maintenance

## Checking for updates

```sh
sh scripts/keenlab.sh check
```

reads the four Keenlab product pages (kWeld, kSupply, kCap, firmware update tool) and compares
every manual, firmware or model file they link against `keenlab.manifest`. It reports:

- `NEW <url>`: Keenlab links a file the manifest does not list.
- `CHANGED <url>`: a listed file has different contents.
- `MISSING <url>` or `UNREACHABLE <url>`: a download failed.

Exit 1 means something needs a look. To accept a new or changed file, download it, record its
`shasum -a 256`, and edit `keenlab.manifest`. Keep the manifest in step with the docs that cite
manual revisions.

State as of 2026-10-29: firmware r2.9 is current (the download is byte-identical to a copy from
2023); Keenlab republished all four manuals on 2026-10-27 (kWeld assembly r6.0, kWeld operating
r4.0, kSupply r2.0, kCap r3.0).

## Revisions

Read the revision printed on each board and record it here. Keenlab's current documents cover:

- kWeld: hardware revisions 3 to 3.3 (assembly manual r6.0). Revision 2 differs; see the manual.
- kCap: the manual was written for revision 4; current modules are revision 6, and the manual
  notes differences by revision.
- kSupply: revision 5.

Owned revisions: not read yet.

Hardware upgrades: none were found on the four Keenlab product pages as of 2026-10-29. That is
not evidence that none exist; ask Keenlab, or check the endless-sphere and EEVblog kWeld threads.

## Firmware

The boot screen shows the installed version. If it already shows 2.9, nothing to do; r2.9 is
what Keenlab currently links. To flash, follow the operating manual, "Updating the firmware":

- Set the adapter's voltage switch to 3.3 V; it ships with the jumper in the wrong position.
- Connect it to the update connector shown in the manual (a 2x6 header beside a screw
  terminal). Confirm its position on your board revision before plugging in.
- Send the `.enc` file over YMODEM from a serial terminal, then reset.

The printed case has no opening for this header, so flashing means taking the top off. Every
joint uses heat-set inserts, so opening it repeatedly is fine; reprint any part that wears.

The update adapter is stored loose for now. A holder inside the case is planned once the
adapter's dimensions and free wall space near the header have been measured.

## Reprinting

Models are unmodified upstream files. For a changed part, add an OpenSCAD source under
`openscad/` instead of editing the upstream 3MF.
