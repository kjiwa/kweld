# Build

Everything here applies to Printables 1443318. The upstream page has the author's photos and
assembly notes; this page records the choices and checks specific to this build.

## Parts

Printed, in `models/printables-1443318/`. Sizes are the 3MF bounding boxes, in print orientation,
in mm (x, y, z). The printer here is a Prusa MK3S+ (250 x 210 x 210), so every part fits.

- kWeldCase_BottomLeft: 134 x 108 x 180
- kWeldCase_BottomRight: 134 x 141 x 131
- kWeldCase_TopLeft: 134 x 113 x 177
- kWeldCase_TopRight: 134 x 85 x 142
- kWeldCase_FanShroud: 120 x 48 x 120
- kWeldCase_kSupplySupportBracket: 94 x 16 x 18
- kWeldCase_Nameplate: 110 x 32 x 3
- kWeldCase_PowerButton_Wrench: 34 x 34 x 60

Bought, from the upstream BOM:

- M3 heat-set inserts, 47.
- M3 flat-head screws, 16 x 6 mm (top and left/right joint), 5 x 8 mm, 4 x 10 mm (feet),
  2 x 12 mm (kSupply bracket); M3 button-head 6 mm, 16 (PCBs to case).
- M3 x 30 socket-head screws with washers, 4, for the fan and its grille.
- 120 mm fan and grille. The kCap fan connector is temperature controlled and limited to 500 mA;
  Keenlab recommends the Scythe SY1225SL12SH. Whether the Corsair SP120 Elite meets that limit
  and connector is not verified.
- Lit pushbutton switch, Switchcraft 142AX jack and 750 plug for the pedal, four rubber feet,
  hookup wire, ferrules and ring terminals.

Upstream lists the screw counts in the author's own words; check the page for the current list.

## Printing

- Material: PETG for BottomLeft, BottomRight, TopRight and FanShroud; PLA for the rest. The
  kWeld stops welding when its power switch passes 70 C, so the surrounding air can exceed PLA's
  softening point of roughly 55 to 60 C. Which of those parts sits nearest the heat sources has
  not been checked against the assembled case; revisit the split after the first test session.
- PLA softens and creeps rather than failing suddenly, so a PLA part that warps is reprintable,
  not dangerous. Prusament PETG V0 is UL 94 V-0 certified, but only when printed on an MK3S+,
  MK4 or XL with Prusa's approved profiles, and it costs more; use it if a flame rating matters.
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
