// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_struct(x_cord, y_cord, struct_type)
{
var _struct = instance_create_layer(x_cord, y_cord, "Active", obj_structure_parent);

with _struct {
	switch struct_type {
		case struct.furnace:
			draw_spr = spr_struct_furnace;
			draw_menu = menu_type.furnace;
			break;
		case struct.points_shop:
			draw_spr = spr_struct_points_shop;
			draw_menu = menu_type.points_shop;
			break;
		case struct.mouse_tool:	
			draw_spr = spr_struct_mouse_level_station;
			draw_menu = menu_type.mouse_tool;
			break;
		case struct.workbench:	
			draw_spr = spr_struct_workbench;
			draw_menu = menu_type.furnace; //TODO
			break;
		case struct.anvil:	
			draw_spr = spr_struct_anvil;
			draw_menu = menu_type.anvil; 
			break;
		
	}
}

}