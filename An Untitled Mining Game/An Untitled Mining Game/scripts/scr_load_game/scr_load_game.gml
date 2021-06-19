// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_game() 
{
// Load Game
var node_type_array = obj_SaveTracker.nta;
var load_kill_list = obj_SaveTracker.lkl;
// for every parant instance, build a map to append to the list
var i = 0; repeat(array_length(node_type_array)) {
	with (node_type_array[i])
	{
		instance_destroy();
	}
	i++;
}
var i = 0; repeat(array_length(load_kill_list)) {
	with (load_kill_list[i])
	{
		instance_destroy();
	}
	i++;
}

// put it back!!!
if (file_exists("savegame.sav")) {
	var _buffer = buffer_load("savegame.sav");
	var in_string = buffer_read( _buffer, buffer_string);
	buffer_delete(_buffer);
	
	var load_data = json_parse(in_string);
	
	while (array_length(load_data) > 0 ) {
		var load_entity = array_pop(load_data);

		with (instance_create_layer(load_entity.x, load_entity.y, load_entity.layer, asset_get_index(load_entity.obj))) {
			switch (load_entity.obj) {
			//-----Nodes
				case "obj_NodeController":
					#region
					if (variable_instance_exists(load_entity, "node_spawn_limit")) {
						node_spawn_limit = load_entity.node_spawn_limit; }
					if (variable_instance_exists(load_entity, "nodes_spawned")) {
						nodes_spawned = load_entity.nodes_spawned; }
					if (variable_instance_exists(load_entity, "node_region_spawns")) {
						node_region_spawns = load_entity.node_region_spawns; }
					if (variable_instance_exists(load_entity, "node_region_spawn_limit")) {
						node_region_spawn_limit = load_entity.node_region_spawn_limit; }
					break;
					#endregion
				case "obj_node_parent":
					#region
					if (variable_instance_exists(load_entity, "_health")) {
						_health = load_entity._health; }
					if (variable_instance_exists(load_entity, "max_health")) {
						max_health = load_entity.max_health; }
					if (variable_instance_exists(load_entity, "spr_to_draw")) {
						spr_to_draw = load_entity.spr_to_draw; }
					if (variable_instance_exists(load_entity, "mask_index")) {
						mask_index = load_entity.mask_index; }
					if (variable_instance_exists(load_entity, "drop_array")) {
						drop_array = load_entity.drop_array; }
					if (variable_instance_exists(load_entity, "tool_to_use")) {
						tool_to_use = load_entity.tool_to_use; }
					if (variable_instance_exists(load_entity, "region")) {
						region = load_entity.region; }
					break;
					#endregion
				case "obj_mob_parent":
					#region
					if (variable_instance_exists(load_entity, "timer")) {
						timer = load_entity.timer; }
					if (variable_instance_exists(load_entity, "mob_type")) {
						mob_type = load_entity.mob_type; }
					if (variable_instance_exists(load_entity, "follow_radius")) {
						follow_radius = load_entity.follow_radius; }
					if (variable_instance_exists(load_entity, "attack_radius")) {
						attack_radius = load_entity.attack_radius; }
					if (variable_instance_exists(load_entity, "_health")) {
						_health = load_entity._health; }
					if (variable_instance_exists(load_entity, "max_health")) {
						max_health = load_entity.max_health; }
					if (variable_instance_exists(load_entity, "attack_power")) {
						attack_power = load_entity.attack_power; }
					if (variable_instance_exists(load_entity, "mask_index")) {
						mask_index = load_entity.mask_index; }
					if (variable_instance_exists(load_entity, "drop_array")) {
						drop_array = load_entity.drop_array; }
					if (variable_instance_exists(load_entity, "tool_to_use")) {
						tool_to_use = load_entity.tool_to_use; }
					if (variable_instance_exists(load_entity, "region")) {
						region = load_entity.region; }
					if (variable_instance_exists(load_entity, "move_spd")) {
						move_spd = load_entity.move_spd; }
					break;
					#endregion
			//-----Obj_items
				case "obj_item":
					#region
					if (variable_instance_exists(load_entity, "item_num")) {
						item_num = load_entity.item_num; }
					if (variable_instance_exists(load_entity, "x_frame")) {
						x_frame = load_entity.x_frame; }
					if (variable_instance_exists(load_entity, "y_frame")) {
						y_frame = load_entity.y_frame; }
					drop_move = false; // Assumed, so not needed in save file
					break;
					#endregion
			//-----Structs
				case "obj_structure_parent":
					#region
					if (variable_instance_exists(load_entity, "structure_level")) {
						structure_level = load_entity.structure_level; }
					if (variable_instance_exists(load_entity, "in_use")) {
						in_use = load_entity.in_use; }
					if (variable_instance_exists(load_entity, "menu_up")) {
						menu_up = load_entity.menu_up; }
					if (variable_instance_exists(load_entity, "base_speed")) {
						base_speed = load_entity.base_speed; }
					if (variable_instance_exists(load_entity, "wait_time")) {
						wait_time = load_entity.wait_time; }
					if (variable_instance_exists(load_entity, "current_step")) {
						current_step = load_entity.current_step; }
					if (variable_instance_exists(load_entity, "output")) {
						output = load_entity.output; }
					if (variable_instance_exists(load_entity, "draw_spr")) {
						draw_spr = load_entity.draw_spr; }
					if (variable_instance_exists(load_entity, "draw_menu")) {
						draw_menu = load_entity.draw_menu; }
					break;
					#endregion
			//-----Player
				case "obj_player":
					#region
					if (variable_instance_exists(load_entity, "spd")) {
						spd = load_entity.spd; }
					if (variable_instance_exists(load_entity, "x_frame")) {
						x_frame = load_entity.x_frame; }
					if (variable_instance_exists(load_entity, "y_frame")) {
						y_frame = load_entity.y_frame; }
					if (variable_instance_exists(load_entity, "dir")) {
						dir = load_entity.dir; }
					if (variable_instance_exists(load_entity, "health")) {
						health = load_entity.health; }
					if (variable_instance_exists(load_entity, "health_timer")) {
						health_timer = load_entity.health_timer; }
					if (variable_instance_exists(load_entity, "health_timer_threshold")) {
						health_timer_threshold = load_entity.health_timer_threshold; }
					if (variable_instance_exists(load_entity, "i_frames")) {
						i_frames = load_entity.i_frames; }
					if (variable_instance_exists(load_entity, "i_frames_remaning")) {
						i_frames_remaning = load_entity.i_frames_remaning; }
					break;
					#endregion
					//-----Inventory
					case "obj_inventory":
					#region
						if (variable_instance_exists(load_entity, "inv_slots")) {
							inv_slots = load_entity.inv_slots; }
						if (variable_instance_exists(load_entity, "pickup_slot")) {
							pickup_slot = load_entity.pickup_slot; }
						if (variable_instance_exists(load_entity, "selected_slot")) {
							selected_slot = load_entity.selected_slot; }
						var inv_array = load_entity.inv_array;
						var ii = 0; repeat(inv_slots){
							ds_inventory[# 0, ii] = inv_array[ii][0];
							ds_inventory[# 1, ii] = inv_array[ii][1];
							ii++;
						}
						break;
						#endregion
					//-----Relics
					case "obj_relics_menu":
					#region
						if (variable_instance_exists(load_entity, "global")) {
							global = load_entity.global; }
						if (variable_instance_exists(load_entity, "pick_power")) {
							pick_power = load_entity.pick_power; }
						if (variable_instance_exists(load_entity, "bonus_inv_slots")) {
							bonus_inv_slots = load_entity.bonus_inv_slots; }
						break;
					#endregion
			default:
				break;
			}
				
		}
	}
	if (global.is_paused) {
		global.is_paused = false;
		with (obj_GameState) {
			show_menu = false;
			drawn_menu = false;
		}
	}
}
show_debug_message("Loaded savegame.sav")
}