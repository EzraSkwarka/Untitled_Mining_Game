//Stay on screen`
clamp(x, 0, global.ScreenWidth);
clamp(y, 0, global.ScreenHeight);


if (drop_move) { //inital Spawn
	x = lerp(x, x_goal, .1);	
	y = lerp(y, y_goal, .1);
	if ((abs(x - x_goal) < 1) and (abs(y - y_goal) < 1)) {
		drop_move = false;
	}
} else {

	
	
	var px = obj_player.x;
	var py = obj_player.y;
	var r = dectition_radius;
	var ia = item_amount;
	lerp_speed = .15;
	
	
	if (point_in_circle(px, py, x, y, r)) { // if player within dection radius
	// Is inventory full
	var in = item_num;
	with(obj_inventory) {
			var ds_inv = ds_inventory
			var inventory_full = true;
			//check if item exists already
			var ii = 0; repeat(inv_slots){
				if ((ds_inv[# 0, ii] == 0) or (ds_inv[# 0, ii] == in)) { //if there is an empty slot or a slot of the same item
					inventory_full = false;
					break;
				} else {
					ii += 1;
				}
			}
	if (inventory_full) exit;
	}
		//Am I at the player?
		r = pickup_radius;
		if !(point_in_circle(px, py, x, y, r)) {
			//no, move to player
			x = lerp(x, px, lerp_speed);	
			y = lerp(y, py, lerp_speed);
		} else {
			
			//yes, pickup and destroy
			with(obj_inventory) {
				var ds_inv = ds_inventory
				var picked_up = false;
				//check if item exists already
				var ii = 0; repeat(inv_slots){
					if (ds_inv[# 0, ii] == in) {
						ds_inv[# 1, ii] += ia;
						picked_up = true;
						break;
					} else {
						ii += 1;
					}
				}
				
				//can I add it to an mempty slot
				if (!picked_up) {
					ii = 0; repeat(inv_slots){
						if (ds_inv[# 0, ii] == item.none) {
							ds_inv[# 0, ii] = in;
							ds_inv[# 1, ii] += ia;
							picked_up = true;
							break;
						} else {
							ii += 1;
						}
					}
				}
				

			}
			//destroy item
			if(picked_up) {
				instance_destroy();
			}
		}
		
		
	
	}
	
	//clump together
	//var _other = instance_nearest(x, y, obj_item)
	lerp_speed = .01;
	collision_rectangle_list(
		x - self_mag_radius/2, y - self_mag_radius/2, 
		x + self_mag_radius/2, y + self_mag_radius/2, 
		obj_item, false, true, obj_NodeController.obj_item_clump_list, false);
		
	var _i = 0; repeat(ds_list_size(obj_NodeController.obj_item_clump_list)) {
		var _other = obj_NodeController.obj_item_clump_list[| _i];
		if(	(x_frame == _other.x_frame) 
		and (y_frame == _other.y_frame) 
		and !(_other.drop_move) 
		) {
			show_debug_message("Item Num: " + string(item_num))
				if (abs(x - _other.x) > 1) {
					show_debug_message("X Bad")
					x = floor(lerp(x, _other.x, lerp_speed));
					_other.x = floor(lerp(_other.x, x, lerp_speed));
				}
				if (abs(y - _other.y) > 1) {
					show_debug_message("Y Bad")
					_other.y = floor(lerp(_other.y, y, lerp_speed));
					y = floor(lerp(y, _other.y, lerp_speed));
				}
				if ((abs(x - _other.x) <= pickup_radius) and 
					(abs(y - _other.y) <= pickup_radius)) {
					_other.item_amount += item_amount;
					item_amount = 0;
				}
		}
	}
	ds_list_clear(obj_NodeController.obj_item_clump_list);
	
	
}

if (item_amount <= 0) {
	instance_destroy();	
}