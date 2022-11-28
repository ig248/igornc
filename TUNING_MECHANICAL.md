## Measuring backlash (and stepper calibration)

![Calibration](img/mechanical_calibration_x.jpeg?raw=true "Calibration")

### After initial assembly and a few turture tests:

| | X | Y | Z |
| --- | --- | --- | --- |
| backlash | 0.12mm (equal both ways) | 0.15mm (play; see below) | 0.01mm |
| reproducibility | <0.005mm | < 0.005mm | <0.005mm |
| calibration over 10mm nominal | 10.03mm | 10.09mm | 10.015mm |

Note calibration is mostly explained by DTI not being strictly in-line with lead screw

### After adjustmemt
#### X
- first iteration: with current off, tighten screw until resistance can _just_ be felt while turning leadscrew between fingers --> X backlash decreases to 0.06mm
- second iteration: tighten another 1/16 turn --> backlash down to 0.02mm
#### Y
Backlash is tricky to measure as there is little friction compared to X, and instead cables + DTI itself provide enough spring to keep gantry on one side of the backlash window.
This would obviously not be the case dynamically, and play exceeds 0.15mm initially!

- first tighten: Y backlash --> 0.04mm
- another 1/16 turn: --> 0.05mm (?)
- try again: --> 0.025mm

#### Z
Z is under constant tension, backlash appears to be ~0.01mm out of the box with no adjustment
