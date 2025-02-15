// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_can_consume_item_from_inventory (item_number, item_amount) {
if (item_number == item.renown_ref) {
	if (global.renown >= item_amount) {
		return true
	} else {
		return false
	}
}
with(obj_inventory) {
		var ds_inv = ds_inventory
		var item_found = false;
		var amount_found = 0;
		var ii = 0; repeat(inv_slots){ // look through inventory for pebble
			if (ds_inv[# 0, ii] == item_number) {
				amount_found += ds_inv[# 1, ii];
			}
			ii += 1;
		}
		if (amount_found >= item_amount) {
			item_found = true;	
		}
}
return item_found;
}