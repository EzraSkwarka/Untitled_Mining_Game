var is_free = place_free(x, y);
if (is_free) {
	
	if(alarm_step >= spawn_delay) {
		if ((obj_NodeController.nodes_spawned < obj_NodeController.node_spawn_limit) and 
			(obj_NodeController.node_region_spawns[region] < obj_NodeController.node_region_spawn_limit[region])) {
			scr_create_region_node(region);
		}
		alarm_step = 0;
		spawn_delay = irandom_range(300, 420);
	} else {
		alarm_step += 1;	
	}
}

