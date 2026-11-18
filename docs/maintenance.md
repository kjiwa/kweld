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

Exit 1 means something needs a look. To accept a new or changed file, download it and append
its line to `keenlab.manifest`:

```sh
printf '%s  %s\n' "$(shasum -a 256 FILE | cut -d ' ' -f 1)" URL >> keenlab.manifest
```

Keep the manifest in step with the docs that cite manual revisions.

The manifest records the accepted versions: firmware r2.9 and the manuals kWeld assembly r6.0,
kWeld operating r4.0, kSupply r2.0 and kCap r3.0.

## Revisions

Read the revision printed on each board and compare it with what Keenlab's documents cover:

- kWeld: hardware revisions 3 to 3.3 (assembly manual r6.0). Revision 2 differs; see the manual.
- kCap: the manual was written for revision 4; current modules are revision 6, and the manual
  notes differences by revision.
- kSupply: revisions 5 and 6.

This unit's boards (printed on each board; the date code after the slash is year and month):

- kWeld r3.3 / 1810
- kCap r6 / 2010: the current module, with Skeleton SkelCap capacitors.
- kSupply r6 / 1907: adds an input overvoltage protector over r5.

A board outside the ranges above needs the manual for its revision. To look for hardware
upgrades, read the four Keenlab product pages, ask Keenlab, or check the endless-sphere and
EEVblog kWeld threads; absence from the product pages is not evidence that none exist.

## Firmware

The boot screen shows the installed version. If it already shows 2.9, nothing to do; r2.9 is
what Keenlab currently links. To flash, follow the operating manual, "Updating the firmware":

- Set the adapter's voltage switch to 3.3 V; it ships with the jumper in the wrong position.
- Connect it to the update connector shown in the manual (a 2x6 header beside a screw
  terminal). Confirm its position on your board revision before plugging in.
- Send the `.enc` file over YMODEM from a serial terminal, then reset.

The printed case has no opening for this header, so flashing means taking the top off. Every
joint uses heat-set inserts, so opening it repeatedly is fine; reprint any part that wears.

The case has no holder for the update adapter.

## Reprinting

Models are unmodified upstream files. For a changed part, add an OpenSCAD source under
`openscad/` instead of editing the upstream 3MF.
