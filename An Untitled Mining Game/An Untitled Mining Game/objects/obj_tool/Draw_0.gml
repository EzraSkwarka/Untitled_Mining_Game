with (obj_player) {
	var handsx = x;
	var handsy = y;
}

draw_sprite_part_ext(
	spr_sheet, 0, cell_size * tool_tier, cell_size * selected_tool,
	cell_size, cell_size, handsx, handsy, scale, scale, c_white, 1);