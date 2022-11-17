; homeall.g
; called to home all axes
;
; configure for sensorless homing]
; https://docs.duet3d.com/User_manual/Connecting_hardware/Sensors_stall_detection#configuring-sensorless-homing
; M98 P"homex.g"
; M98 P"homey.g"
; M98 P"homez.g"

M400 ; Wait for current moves to finish
G91                     ; relative positioning
G1 H2 X50 Y-50 Z10 F6000 ; lift Z relative to current position and start moves in X/Y
M913 X50 Y50 ; drop motor current to % of the M906 values in config.g
M400
G1 H1 X{move.axes[0].max-move.axes[0].min+100} Y{move.axes[1].min-move.axes[1].max-100} F3000 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X-5 Y5 F6000       ; go back a few mm
G1 H1 X10 Y-10 F1500  ; move slowly to X and Y axis endstops once more (second pass)

M400
M913 X100 Y100			; return X/Y current to full
G90                     ; absolute positioning
G1 H2 Y{move.axes[1].max + 30} F6000; move to Z homing position

M400
M913 Z50				; lower Z current for homing
G91
G1 H1 Z{move.axes[2].min-move.axes[2].max-100} F3000 ; move quickly to Z axis lower endstop and stop there (first pass)
G1 H2 Z5 F6000     ; go back a few mm
M400
G1 H1 Z-10 F1500 ; move slowly to Z axis endstop once more (second pass)

M400
M913 Z100 ; return Z current to 100%
G1 H2 Z10 F6000; lift Z a bit
G90              ; absolute positioning
G1 X0 Y0 Z50 ; move to default position
M400
