if(place_meeting(x, y, obj_player)) {
//Find total number of items
	var total_count = 0;
	with (obj_inventory) {
		var ds_inv = ds_inventory
		var ii = 0; repeat(inv_slots){ // look through inventory
			total_count += ds_inv[# 1, ii];
			ds_inv[# 0, ii] = 0; // item = none
			ds_inv[# 1, ii] = 0; // amount = none
			ii += 1;
			}
	}

	with (obj_structure_parent) {
		total_count += (2 * structure_level);
	}

	obj_NodeController.nodes_spawned = 0;
	obj_NodeController.node_region_spawns =	[0, 0, 0, 0, 0, 0, 0];
	global.renown += max(floor(log2(total_count)),0);
	global.mouse_level = 0;
	room_restart();

}