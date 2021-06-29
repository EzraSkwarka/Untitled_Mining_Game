enum struct {
	none,
	furnace,
	mouse_tool,
	points_shop,
	workbench,
	anvil,
	height
}

struct_data_array = [
	//Template
		//Name
			//[active_sprite, active_object, required_mats, colwidth, col_height],

	//Furnace
		[spr_struct_furnace, struct.furnace, [item.rock, 10], 30, 22],
	//Mouse Tool
		[spr_struct_mouse_level_station, struct.mouse_tool, [item.shiny_rock, 10], 22, 29],
	//Points Shop
		[spr_struct_points_shop, struct.points_shop, [item.wood, 50], 24, 18], 
	//Workbench
		[spr_struct_workbench, struct.workbench, [item.wood, 25], 27, 19],
	//Anvil
		[spr_struct_anvil, struct.anvil, [item.wood, 10, item.iron_ingot, 5], 21, 15], 
]

show_structures_menu = false;
depth = -1;
scale = 2;
show_inventory = false;

inv_slots = struct.height - 1;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

inv_UI_width = 288;
inv_UI_height = 192;

spr_inv_UI = spr_inventory_UI;
spr_inv_items = spr_struct_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale);
info_y = inv_UI_y + (9 * scale);

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);




ds_struct_menu = ds_grid_create(2, inv_slots);



//Draw in structs
var ii = 1; repeat(struct.height - 1){
	ds_struct_menu[# 0, ii - 1] = ii;
	
	ii += 1;
}