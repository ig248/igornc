; homey.g
; called to home the Y axis
; configure for sensorless homing
; https://docs.duet3d.com/User_manual/Connecting_hardware/Sensors_stall_detection#configuring-sensorless-homing
M400 ; Wait for current moves to finish
G91 ; relative positioning
G1 H2 Y-50 Z10 F6000    ; lift Z relative to current position and start move
M913 Y50 ; drop motor current to percentage of the M906 values in config.g
M400
G1 H1 Y{move.axes[1].min-move.axes[1].max-100} F3000 ; move quickly to Y axis endstop and stop there (first pass)
G1 H2 Y5 F6000     ; go back a few mm
G1 H1 Y-10 F1500 ; move slowly to Y axis endstop once more (second pass)

G90 ; absolute positioning
M400
M913 Y100 ; return current to 100%
G1 H2 Y0 F6000; return to center
; lower Z again
G91
G1 H2 Z-10 F1000
G90
M400
