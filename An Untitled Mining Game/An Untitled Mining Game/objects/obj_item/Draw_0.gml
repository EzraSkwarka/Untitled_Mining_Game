draw_sprite_part(item_spr, 0, x_frame * cell_size, y_frame * cell_size, 
				 cell_size, cell_size, x - x_offset, y - y_offset);
if (item_amount > 1) {
	draw_set_font(fnt_smalldigits);
	draw_set_color(c_black);
	draw_text(x, y, "x" + string(item_amount));
					 
}

exit;
//debug
draw_rectangle(
				x - self_mag_radius/2, y - self_mag_radius/2, 
				x + self_mag_radius/2, y + self_mag_radius/2, 
				true);