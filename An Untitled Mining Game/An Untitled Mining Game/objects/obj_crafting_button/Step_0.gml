var _hover = scr_get_hover(width, height);
var click = _hover and mouse_check_button_pressed(mb_left);

hover = lerp(hover, _hover, 0.1);

if (_hover and click) {
	show_debug_message("making one")
	//scr_create_obj_item(item_type, x_loc, y_loc);	
}