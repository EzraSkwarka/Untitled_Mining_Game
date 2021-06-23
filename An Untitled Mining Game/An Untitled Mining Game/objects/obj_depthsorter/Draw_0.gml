var ogrid = tracking_grid;
//Reisze Grid
var inst_number = instance_number(obj_draw_parent);
if (ds_grid_height(ogrid) != inst_number) {
	ds_grid_resize(ogrid, 2, inst_number);
}

//Populate Grid
var i = 0; with(obj_draw_parent) {
	ogrid[# 0, i] = id;
	ogrid[# 1, i] = y;
	i++;
}

//Sort Grid
ds_grid_sort(ogrid, 1, true);

//Draw
i = 0; repeat(inst_number) {
	var inst = ogrid[# 0, i];
	with inst {
		event_perform(ev_draw, 0);	
	}
	i++;
}
