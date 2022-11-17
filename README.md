# IgorNC - a random numerically controlled contraption with a dual printing head
![Thumbnail](img/igornc_head.jpeg?raw=true "Thumbnail")

## Mechanics
Comprises three (almost) identical linear actuators built around C-beams with machined end caps

![Endplates](img/endplates.jpeg?raw=true "Endplates")
All mechanics are maximally over-engineered to compensate for a poorly conceived and inherently unstable gantry design.

- endplates are machine 8mm aluminium
- transition fit for NEMA17 motor journals
- press fit for flanged bearings
- 3 NEMA17 steppers with integrated ~500mm leadscrews
- all 3 axes differ in gantry plates only, but use otherwise interchangable components
## Print head

- dual head
- 1.75mm bowden extruders (Titan from E3D)
- custom cooling blower provides a thin horizontal sheet of air

## Print bed
- print area is 360x360mmm
### First iteration
- bakelite heated bed 
- overengineered kinematic mounts: machined, hardened, and surface ground V-Blocks locating on cap screw heads :D

### Second iteration
![Bed v2](img/aluminium_bed.jpeg?raw=true "Bed v2")

- machined from 6mm aluminium, heater fully recessed
- removable magnetic print surface from Ender 5 Plus
- rigidly bolted to the X gantry to reduce vibrations

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

### Bed probing
Currently done by detecting contact between print head and a steel feeler gauge :D

### Bed leveling
- G29.1 allows loading an interpolated height map for a given temperature using RepRap firmware support for "meta-commands".

### Macros
`triggerX.g` allow customizing button actions, e.g. the "Green" button will resume print if paused, or print last file again if not currently printing.

`load.g`/`unload.g` provide parametrized macros to simplify filament management.
