# Operation

The Keenlab manuals are the reference; this page is the order of operations and the things
worth re-reading before each session. Run `sh scripts/keenlab.sh fetch` once to get them.

## Before a session

1. `sh scripts/keenlab.sh check`. A reported file means Keenlab published something new; see
   [maintenance.md](maintenance.md).
2. Inspect the case, cables and electrodes. Nothing loose, nothing hot, no cracked parts.
3. Never leave the system unattended while powered.

## Power-up

The kWeld picks its mode from the pedal at the moment it is connected to power:

- Pedal not pressed: manual mode. The pedal triggers each pulse.
- Pedal pressed (or the jack shorted by having no plug): automatic mode. Touching the electrodes
  to the work triggers the pulse.

Plug the pedal in, and keep it released, before applying power. With the jack empty (see
[build.md](build.md)) the unit starts in automatic mode.

Keenlab operating manual, "Using the welder", "Using manual mode" and "Using automatic mode".
Start in manual mode until the system is calibrated and trusted.

The startup screens show the firmware version, the input voltage, then the mode. If the
electrodes touch, "Remove short!" is shown until they are apart.

## First use

The unit ships uncalibrated and shows CAL until calibrated; calibrate before the first weld, and
again after changing electrodes or cables. Operating manual, "Calibration".

The kSupply must be set to the right charge voltage for the kCap revision before the kCap is
connected: kSupply manual, "Setting output voltage and current"; kCap manual, "Operation guide".
Use a plastic screwdriver and turn the trimmers gently. Do not turn the current trimmer fully
counterclockwise.

Start at a low energy on scrap and empty cells and increase in steps, checking each weld with a
pull test. The starting-energy table in the operating manual is not a recommendation.

## Warnings screens

- Overtemp: the power switch is above 70 C; wait.
- Fuse: broken or unseated fuse; find the cause before replacing it.
- Low batt: only when a battery warning level is set.

## Shutdown and storage

The kCap holds charge for hours after power-off; its power LED is lit while the capacitors are
above 2 V. Until it is out, do not reach into the case, and never short the kCap, bus bar or
electrode terminals: a short draws a very large current.

Keep the electrode cables away from any power source: they are the output of a switch.
