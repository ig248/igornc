echo "Orange button pressed - doing some tricks!"
var r = 50
M400
G90
G0 X0 Y0 Z{2 * var.r}
G91
; circle 
G1 X{var.r}
G17 ; XY
G2 X{-2 * var.r} Y0 Z0 I{-var.r} J0 R{var.r}
G2 X{2 * var.r} Y0 Z0 I{var.r} J0 R{var.r}
G18 ; XZ
G2 X{-2 * var.r} Y0 Z0 I{-var.r} J0 R{var.r}
G2 X{2 * var.r} Y0 Z0 I{var.r} J0 R{var.r}
G90
G0 X0 Y0 Z{2 * var.r}
M400