; Filament un-loading script
; param S = name of filament
; param R = temperature
if !exists(param.R) | param.R <= 0
	abort "No temperature provided"
G10 S{param.R} ; Set current tool active temperature
M568 A2 ; Set tool active
M291 P"Please wait while the nozzle is being heated up" R{"Unloading " ^ param.S} ; Display message
M116 ; Wait for the temperatures to be reached

M291 P"Retracting filament..." R{"Unloading " ^ param.S} T5 ; Display new message
M83 ; Extruder to relative mode
G1 E-10 F300
G1 E-20 F500
G1 E-20 F1000
M568 A1  ; put current tool heater on stand-by
G1 E-430 F3000
G1 E-100 F500 ; Through extruder
M400 ; Wait for moves to complete
M292 ; Hide the message
