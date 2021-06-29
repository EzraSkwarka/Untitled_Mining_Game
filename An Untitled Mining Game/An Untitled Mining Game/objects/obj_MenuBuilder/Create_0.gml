//State Tracking
menu_active = false;
menu_to_draw = menu_type.none;

//Passing Vars
menu_drawn = false;
struct_refrence = 0;
crafting_menu_drawn = false;
redraw = false;



//Button Containers
button_ref_list = ds_list_create();
button_update_ref_list = ds_list_create();

enum menu_type {
	none,
	furnace,
	mouse_tool,
	points_shop,
	anvil,
	workbench
}

//Crafting Info
draw_craft = false;
recipe_name = "";
input = 0;
output = 0;
crafting_time = 0;
item_amount = 1;
dynamic = false;


//GUI settings
screen_width = 1280;
screen_height = 960;

//Recipes
Recipes = [];
