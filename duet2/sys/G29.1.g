; load interpolated height map for the current bed temperature
; Optional parameter S sets a different bed temparature from current	
var bedtemp = heat.heaters[0].current
var maptemp = var.bedtemp
if exists(param.S)
   set var.maptemp = param.S

set var.maptemp = floor(floor(var.maptemp/10 + 0.5) * 10)
var temp_str = "" ^ var.maptemp
if var.maptemp < 100
	set var.temp_str = "0" ^ var.temp_str

var filename = "heightmaps/heightmap_" ^ var.temp_str ^ "C_interp.csv"
echo "Loading heightmap " ^ var.filename
G29 S1 P{var.filename}
