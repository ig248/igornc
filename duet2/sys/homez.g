; homez.g
; called to home the Z axis
; configure for sensorless homing
; https://docs.duet3d.com/User_manual/Connecting_hardware/Sensors_stall_detection#configuring-sensorless-homing
M400
if !move.axes[1].homed
	echo "Axis Y needs to be homed before homing Z"
	M99

G91
G1 H2 Z10 F6000     ; lift Z a few mm

G90              ; absolute positioning
G60 S0			 ; save position
G1 H2 Y{move.axes[1].max + 30} F6000; move to Z homing position

M400
M913 Z50 ; drop motor current to percentage of the M906 values in config.g
G91               ; relative positioning
G1 H1 Z{move.axes[2].min-move.axes[2].max-100} F3000 ; move quickly to Z axis lower endstop and stop there (first pass)
G1 H2 Z5 F6000     ; go back a few mm
M400
G1 H1 Z-10 F1500 ; move slowly to Z axis endstop once more (second pass)

M400
M913 Z100 ; return current to 100%
G1 H2 Z50 F6000; lift Z a bit
G90              ; absolute positioning
G1 Y0 R0		 ; return to original Y position
M400
