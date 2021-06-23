// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_node_left_click(_self) 
//function scr_node_left_click(_health, tool_to_use, resource_mat_number_to_spawn, base_rate) 
{
	with(obj_toolbar) {
		var current_tool = equiped_tool;
	}
	with (obj_tool) {
		if !(swing_state == "rest") {
			var is_swinging = true;
		} else {
			var is_swinging = false;	
		}
	}
	if ((current_tool == _self.tool_to_use)) {
		if !is_swinging {
			if (distance_to_object(obj_player) <= 16) {
				if (_self._health > 0) {
					_self._health -= obj_relics_menu.pick_power;
				} 
		
				if (_self._health <= 0) {
					obj_NodeController.nodes_spawned -= 1;
					obj_NodeController.node_region_spawns[@ _self.region] -= 1
					
					var bonus_multiplier = (1 + .1 * (scr_get_mouse_level() + global.renown));
					var _i = 0; repeat(floor(array_length(_self.drop_array)/2)) {
						var _count = floor(_self.drop_array[@_i + 1] * bonus_multiplier);
						if (_count > 15) {
							var basket_size = _count div 15;
							var remainder = _count mod 15;
							repeat(15) {
								var inst = instance_create_layer(x, y, "Active", obj_item);
								with (inst) {
									item_num = _self.drop_array[@_i];
									item_amount = basket_size;
									if (remainder > 0) {
										item_amount++;
										remainder--;
									}
									x_frame = item_num mod (spr_width/cell_size);
									y_frame = item_num div (spr_width/cell_size);
								}
							}
						} else {
							repeat(_count) {
								var inst = instance_create_layer(x, y, "Active", obj_item);
								with (inst) {
									item_num = _self.drop_array[@_i];
									item_amount = 1;
									x_frame = item_num mod (spr_width/cell_size);
									y_frame = item_num div (spr_width/cell_size);
								}
							}
						}
						_i += 2;		
					}
					instance_destroy(_self);
				}
			}
		
		}
	}
}