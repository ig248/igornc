; Filament loading script
; param S = name of filament
; param R = temperature
if !exists(param.R) | param.R <= 0
	abort "No temperature provided"
G10 S{param.R} ; Set current tool active temperature
M568 A2 ; Set tool active
M291 P"Feeding filament..." R{"Loading " ^ param.S} T5 ; Display new message
M83 ; Extruder to relative mode
G1 E50 F300 ; Through extruder
M291 P"Please wait while the nozzle is being heated up" R{"Loading " ^ param.S} T5 ; Display message
M116 ; Wait for the temperatures to be reached
G1 E430 F3000 ; to top of cold block
G1 E20 F1000
G1 E20 F500
G1 E10 F300
G4 P1000 ; Wait one second
G1 E-10 F150 ; Retract 10mm of filament at 1800mm/min
M400 ; Wait for moves to complete
M292 ; Hide the message
M568 A1  ; put current tool heater on stand-by
