if (global.is_paused) exit;

if (!building) {
	window_set_cursor(cr_default);
} else {
	if (mouse_check_button_pressed(mb_right)) {
		building = false;
		global.is_paused = true;
		with (obj_structures_menu) {
			show_structures_menu = true;
		}
		window_set_cursor(cr_default);
		exit;
	}
	
	window_set_cursor(cr_none);
	mousex = mouse_x;
	mousey = mouse_y;
	
	// Determine active struct
	active_sprite = obj_structures_menu.struct_data_array[ selected_struct - 1][ 0];
	active_object = obj_structures_menu.struct_data_array[ selected_struct - 1][ 1];
	required_mats = obj_structures_menu.struct_data_array[ selected_struct - 1][ 2];
	col_width =		obj_structures_menu.struct_data_array[ selected_struct - 1][ 3];
	col_height =	obj_structures_menu.struct_data_array[ selected_struct - 1][ 4];
		
	
	//Determine if area is clear
	var cH = cellHeight;
	var cW = cellWidth;
	mousex_adjusted = (mousex div cW);
	mousey_adjusted = (mousey div cH);
	if ((mousex_adjusted mod 2) == 0) {
		mousey_adjusted = (mousey div cH) * cH + cell_offset_y + (cH/2);
	} else {
		mousey_adjusted = (mousey div cH) * cH + cell_offset_y + cH;	
	}
	mousex_adjusted = mousex_adjusted * cW + cell_offset_x + (cW/2);

	hex_empty = true
	var _i = 0; repeat (array_length(solid_objects)) {
		if (collision_rectangle(mousex_adjusted - col_width/2, mousey_adjusted - col_height/2,
								mousex_adjusted + col_width/2, mousey_adjusted + col_height/2,
								solid_objects[_i], false, true) != noone) {
			hex_empty = false;
		}
		_i++;
	}
	
	//Build
	if (mouse_check_button_pressed(mb_left) and scr_have_mats(required_mats) and hex_empty) {
		scr_create_struct(mousex_adjusted, mousey_adjusted, active_object);
		scr_consume_mats(required_mats)
	}
}