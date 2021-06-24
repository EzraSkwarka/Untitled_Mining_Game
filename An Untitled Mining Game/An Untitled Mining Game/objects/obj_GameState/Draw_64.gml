#region Health and Stamina
//draw_text_layered(300, 5, fnt_Omom_24, c_black, fnt_Omom_solid_24, c_red, string(health));
var max_health = obj_player.max_health;
var scale = 2.15;
var x_start = 30;
var y_start = 30;
var _i = 0; repeat (max_health) {
	if (health == (_i + 1)) {
		draw_sprite_ext(spr_heart, heart.full, x_start + (_i * 18 * scale), y_start, 
						(scale + abs(scale_timer)), (scale + abs(scale_timer)), 0, c_white, 1);
	} else if (health > _i) {
		draw_sprite_ext(spr_heart, heart.full, x_start + (_i * 18 * scale), y_start, 
						scale, scale, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_heart, heart.empty, x_start + (_i * 18 * scale), y_start, 
						scale, scale, 0, c_white, 1);
	}
	_i++
	if (_i == 8) {
		y_start = 60;
		x_start -= ((_i * 18 * scale));
	}
}

scale_timer += .01;
if (scale_timer >= .5) {
	scale_timer = -.5;	
}
#endregion

#region Pause Menu
if(global.is_paused)
{
	draw_set_color(c_black);
	draw_set_alpha(.6)
	draw_rectangle(view_xport[0],view_yport[0], view_wport[0], view_hport[0], 0);
	draw_set_alpha(1)
	draw_set_color(c_white);
	draw_set_font(fnt_basic_large);
	
	if show_menu {
		if !drawn_menu {
			var _height = 100;
			var _width = 300;
			save_button = scr_create_button(screen_width/2 - _width/2, screen_height/3, _width, _height,
								"Save Game", scr_save_game)		
			load_button = scr_create_button(screen_width/2 - _width/2, screen_height/3 + 150, _width, _height,
								"Load Game", scr_load_game)
			exit_button = scr_create_button(screen_width/2 - _width/2, screen_height/3 + 300, _width, _height,
								"Exit Game", game_end)
			drawn_menu = true;
		}
	}
}
#endregion