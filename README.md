# kweld

Enclosure files, wiring notes and operating notes for a [Keenlab](https://www.keenlab.de/)
kWeld capacitor-discharge battery spot welder, built from a kWeld, a kCap
ultracapacitor module, a kSupply charger module and an HP server power supply.

Keenlab sells the boards as bare kits and publishes only per-board enclosures. This repository
holds a printable case that houses the whole system, and the notes needed to build, use and
maintain it after a long gap.

## Status

- Case: Printables 1443318 files are vendored unmodified; no part has been printed yet.
- System: assembled on the bench, never used. Calibration, first weld and the fan hookup are
  still to do.
- Not verified yet: board revisions, the boot-screen firmware version, the pedal plug type, the
  fan connection. [docs/maintenance.md](docs/maintenance.md) lists what to read off the hardware.

## The system

- kWeld: the welder board. Weld input 4 to 30 V DC, 2000 A switch, up to 500 J per pulse.
- kCap: ultracapacitor bank that the kWeld draws its pulse from.
- kSupply: charges the kCap from a server power supply.
- Server power supply: the HP HSTNS-PR01 family, 800 to 1000 W depending on mains voltage.
- Foot pedal: triggers welds in manual mode.
- kWeld firmware update tool (Keenlab calls it the programmer module): USB-serial adapter, used
  only to flash firmware.
- Case: Printables 1443318.

## Documents

- [docs/build.md](docs/build.md): printing, parts, assembly and wiring.
- [docs/operation.md](docs/operation.md): before a session, modes, calibration, shutdown and safety.
- [docs/maintenance.md](docs/maintenance.md): updates, firmware, reopening the case, revisions.
- [docs/alternatives.md](docs/alternatives.md): other welders, and whether to build this one.

## Keenlab manuals and firmware

Keenlab's files are all rights reserved and are not copied into this repository.
`scripts/keenlab.sh` downloads them into `vendor/` and checks them against `keenlab.manifest`:

```sh
sh scripts/keenlab.sh fetch   # download and verify into vendor/
sh scripts/keenlab.sh check   # report new, changed or missing Keenlab files; exit 1 if any
```

## Sources and licenses

- `models/printables-1443318/`: "Mains-powered kWeld Lithium battery spot welder case" by
  LayerSlayer_3238836, CC BY-SA 4.0, unmodified. A remix of "Mains powered kWeld battery spot
  welder case" by Cederb, CC BY-SA 4.0.
- Everything else here is under CC BY-SA 4.0 ([LICENSE](LICENSE)).
- kWeld, kCap and kSupply are products of keenlab UG (haftungsbeschraenkt). This project is not
  affiliated with Keenlab.

## Safety

The kCap stores about 7000 Ws and takes hours to bleed down; the system can injure or start a
fire if handled badly. Read the warning in every Keenlab manual and
[docs/operation.md](docs/operation.md) before powering anything.
