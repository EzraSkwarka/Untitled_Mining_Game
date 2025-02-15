if(!show_structures_menu) exit;

window_set_cursor(cr_default);

draw_sprite_part_ext(
	spr_inv_UI, 0, cell_size, 0, inv_UI_width, inv_UI_height, 
	inv_UI_x, inv_UI_y, scale, scale, c_white, 1
);

//draw_set_font(fnt_Omom_solid_24);
//var c = c_white; 
//draw_text_color(info_x, info_y, "Structures", c,c,c,c, 1);

//draw_set_font(fnt_Omom_24);
//var c = c_black; 
//draw_text_color(info_x, info_y, "Structures", c,c,c,c, 1);

draw_text_layered(info_x, info_y, fnt_Omom_24, c_black, 
					fnt_Omom_solid_24, c_white, "Structures")

draw_set_font(fnt_smalldigits);

//------Inventory
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid, c;
// ii is the inventory slot index, ix and iy denote its xy cords
// xx yy are the x,y location for slot
//sx and sy are the cords of the sprite on iots sprite sheet
//iitem is the inventory item/object
//inv_grid is the local version of the enumerated item grid
ii = 0; ix = 0; iy = 0; inv_grid = ds_struct_menu;

repeat(inv_slots){
	//x,y location for slot
	xx = slots_x + ((cell_size+x_buffer)*ix*scale);
	yy = slots_y + ((cell_size+y_buffer)*iy*scale);
	
	//Item
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	
	//Draw Slot and Item
	draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	switch(ii) {
		case selected_slot:
			if(iitem > 0) draw_sprite_part_ext(
				spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, .3);
			gpu_set_blendmode(bm_normal);
		break;
		
		case pickup_slot:
			if(iitem > 0) draw_sprite_part_ext(
				spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, .2
			);
		break;
		
		default:
			if(iitem > 0) draw_sprite_part_ext(
				spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
	}
	
	//Draw item Number
	if(iitem > 0){
		var number = inv_grid[# 1, ii];
		var c = c_white;
		draw_text_color(xx, yy, string(number), c,c,c,c, 1);
	}
	
	//Increment
	ii += 1;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width;
}

if (pickup_slot != -1) {
	//Get the item
	iitem = inv_grid[# 0, pickup_slot];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	draw_sprite_part_ext(
			spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, .2
		);

	//Draw the amount
	var inum = inv_grid[# 1, pickup_slot];
	draw_text_color(mousex + (cell_size * scale * .5), mousey, string(inum), c,c,c,c, 1);
}
