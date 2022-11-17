; homex.g
; called to home the X axis
; configure for sensorless homing
; https://docs.duet3d.com/User_manual/Connecting_hardware/Sensors_stall_detection#configuring-sensorless-homing
M400 ; Wait for current moves to finish
G91 ; relative positioning
G1 H2 X50 Z10 F6000    ; lift Z relative to current position and start move
M913 X50 ; drop motor current to percentage of the M906 values in config.g
M400
G1 H1 X{move.axes[0].max-move.axes[0].min+100} F3000 ; move quickly to X axis endstop and stop there (first pass)
G1 H2 X-5 F6000     ; go back a few mm
G1 H1 X10 F1500 ; move slowly to X axis endstop once more (second pass)
G90 ; absolute positioning
M400
M913 X100 ; return current to 100%
G1 H2 X0 F6000; return to center
; lower Z once done
G91
G1 H2 Z-10 F1000
G90
M400