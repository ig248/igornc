# IgorNC - a random numerically controlled contraption with a dual printing head
![Thumbnail](img/igornc_head.jpeg?raw=true "Thumbnail")

## Mechanics
Comprises three (almost) identical linear actuators built around C-beams with machined end caps

![Endplates](img/endplates.jpeg?raw=true "Endplates")
All mechanics are maximally over-engineered to compensate for a poorly conceived and inherently unstable gantry design.

- endplates are machine 8mm aluminium
- transition fit for NEMA17 motor journals
- press fit for flanged bearings

## Print head

- dual head
- 1.75mm bowden extruders (Titan from E3D)
- custom cooling blower provides a thin horizontal sheet of air

## Electronics and control
![Electronics](img/enclosure.jpeg?raw=true "Electronics")
- Duet 2 WiFi controller 
- 350W power supply
- custom laser-cut enclosure
- NC emergency switch
- NO customizable control buttons
- NO reset button (unfortunately, Duet 2 uses a dedicated pin for that, so has to be hard-wired)

## Settings and macros
### Homing
Homing is done switch-less using stall detection.