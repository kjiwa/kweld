# Build

Everything here applies to [Printables 1443318](https://www.printables.com/model/1443318). The
upstream page has the author's photos, assembly notes and comments; this page records the choices
and checks specific to this build.

## Layout and heat

Judged from the author's photos and two makers' photos (one with the boards installed, one
mid-print), not from the 3MF geometry. Confirm during assembly.

- The long left section is the tall one. The kCap board lies on its top deck with the six
  capacitor cells standing up through it; the fan shroud sits directly over the cells and the fan
  on top of that. The kSupply is below the kCap board, with its heatsink, and the HP power supply
  slides in from the rear into the lower part of the left and right sections.
- The right section holds the kWeld under the angled cover: LCD, dial, and the two electrode
  cables out of the angled end. The power button and the nameplate are on the lower front.
- The side slots next to the fan shroud open onto the kCap board's terminals, so air can move
  through the kCap compartment. Which way the fan blows is not specified upstream; the author and
  two makers all used different fans. Pick a direction, measure (below), and flip it if needed.

Where the heat is, and what the fan does:

- The capacitors are the part that matters. They are rated 70 C, and the kCap lights its
  overtemperature LED at about 45 C. The kCap runs its fan from its own fan connector and starts
  it at about 45 C, so the fan exists to cool the cells directly. Keenlab's quoted repetition rate
  (50 J pulses once every 2 seconds) assumes that fan fitted. Without a fan, expect to take
  cooling breaks.
- The HP power supply has its own fans and its rear faces the open rear bay, so most of its heat
  leaves the case there. It still warms the case floor and the air below the kSupply.
- The kWeld's power switch is the least stressed: its resistance is a small fraction of the
  kCap's, so it heats much less per pulse. It locks welding out at 70 C and shows the temperature
  on its status screen.

Expect modest temperatures for light use, but this is reasoning, not measurement. Measure on the
first session: the kWeld status screen for its switch, the kCap overtemperature LED, and a probe
or infrared thermometer on the case near the capacitors and the supply.

## Parts

Printed, in `models/printables-1443318/`. Sizes are the 3MF bounding boxes, in print orientation,
in mm (x, y, z). The printer here is a Prusa MK3S+ (250 x 210 x 210), so every part fits. The
photos suggest the two "Top" parts are the covers (kCap and kWeld) and the two "Bottom" parts the
base with the power supply bay and front panel.

- kWeldCase_BottomLeft: 134 x 108 x 180
- kWeldCase_BottomRight: 134 x 141 x 131
- kWeldCase_TopLeft: 134 x 113 x 177
- kWeldCase_TopRight: 134 x 85 x 142
- kWeldCase_FanShroud: 120 x 48 x 120
- kWeldCase_kSupplySupportBracket: 94 x 16 x 18
- kWeldCase_Nameplate: 110 x 32 x 3
- kWeldCase_PowerButton_Wrench: 34 x 34 x 60

### Parts checklist

Counts are the upstream author's; the upstream page is authoritative. Tick what you have.

Hardware, all M3. The totals match: 47 screws and 47 inserts.

- [ ] Heat-set inserts, 47. Any that fit a 4 mm hole and are 5 to 6 mm long.
- [ ] Flat-head, 16 x 6 mm (top and left/right joint).
- [ ] Flat-head, 5 x 8 mm (left side).
- [ ] Flat-head, 4 x 10 mm (feet).
- [ ] Flat-head, 2 x 12 mm (kSupply bracket).
- [ ] Button-head, 16 x 6 mm (boards to case).
- [ ] Socket-head, 4 x 30 mm, with 4 washers (fan and grille).

Electrical and other:

- [ ] Lit pushbutton switch, 16 mm. The case hole is 16.5 mm and the printed wrench fits a nut
  of about 19 mm across flats, so buy the 16 mm size, not 19 or 22 mm. It switches the kSupply's
  PSU enable line, which the kSupply manual describes as a jumper or a switch, so it must be
  latching. Chosen: a stainless, IP67, latching, 1NO switch with a 5 to 24 V LED, 20 A contacts
  and a plug-in wire socket, 16 mm panel cut. The LED range covers the kSupply output (8.4 V or
  more). Colour is cosmetic. The listing gives an item length of 3.9 in; that likely includes the
  plug and wires, but check the depth behind the front panel when test-fitting. That it switches
  the enable line is inferred from the upstream notes, not confirmed.
- [ ] Pedal jack Switchcraft 142AX and plug 750, or whatever matches your pedal's plug. Not yet
  checked.
- [ ] 120 mm fan and grille. Your Corsair SP120 Elite is 12 V and 0.3 A, inside the kCap's 500 mA
  limit. It has a 4-pin PWM plug and the kCap fan header looks like a small 3-pin one in the
  maker's photo; check the pitch and whether your kCap kit included a fan cable.
- [ ] Four rubber feet (upstream: Keystone 722).
- [ ] Hookup wire, ferrules and ring terminals for the switch and jack; a crimper. The author
  shortened the 8 AWG cables and crimped new terminals.
- [ ] A knob for the kWeld dial, if the stock one does not fit the case: it did not for one
  maker. A printable "16mm wide rotary encoder knob" is Printables 1504384; fit unverified.
- [ ] Cyanoacrylate gel for the nameplate.

Things makers reported on the Printables page:

- The ring terminals joining the kSupply and kCap stick out the back with no clearance. One
  maker planned to cut the back of the case; the author's answer is not posted.
- A supply can shut down on inrush when first connected to the kCap. The kSupply manual
  ("Setting output voltage and current") says to set the current limit before connecting the
  kCap, and to lower it for a weaker supply.
- PETG shrinks; one maker adjusted for it.

## Printing

- Material: PETG for BottomLeft, BottomRight, TopLeft and FanShroud; PLA for TopRight, the
  nameplate, the wrench and the bracket. The warm parts are the ones around the capacitors and
  the power supply (see above); the kWeld cover, TopRight, stays cool. The 70 C kWeld lockout and
  the kCap's 45 C overtemperature LED mean air near the cells can pass PLA's softening point of
  roughly 55 to 60 C.
- PLA softens and creeps rather than failing suddenly, so a warped PLA part is reprintable, not
  dangerous. Prusament PETG V0 is UL 94 V-0 certified, but only when printed on an MK3S+, MK4 or
  XL with Prusa's approved profiles, and it costs more; use it if a flame rating matters.
- The upstream author printed on a CORE One at 0.25 mm and 15 percent infill. MK3S+ settings
  here are unverified: slice first for filament totals (solid volume of all parts is 1.7 L, an
  upper bound), and print supports where the upstream notes say they are needed.
- Print the two bottom parts first and slide the power supply in before printing the rest.
- Upstream errata: the 0.15 mm gap between the left and right bottom parts is tight (0.25 mm
  would be better), and the kWeld's bottom-left screw hole sits under the display.

## Assembly and wiring

Follow the upstream page for order. Notes that are easy to lose:

- Seat heat-set inserts where the bottom parts join no deeper than flush; inserts pushed too far
  block the power supply from sliding in and out.
- Check the HP power supply's connector blades against the pictures in the kSupply manual,
  "Usage with HSTNS-PR01", before connecting it. The manual warns that model names do not always
  match the layout and that a different layout can damage the supply and the kSupply.
- Power button: wired to the kSupply terminal block as the kSupply manual describes. Its LED
  connects to the kSupply output.
- Foot pedal jack: the Switchcraft 142AX has a switch that shorts its wires when the plug is
  out. Wired that way, a unit powered up without the pedal starts in automatic mode. See
  [operation.md](operation.md) before relying on this.
- Input polarity on the kWeld: see the kWeld operating manual, "Using the welder". Reversed
  polarity destroys the board.
- Keenlab's assembly manual, "System", gives the bus-bar, wiring and polarity notes, including
  washer orientation.
