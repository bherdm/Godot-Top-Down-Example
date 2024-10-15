extends Area2D

func on_item_picked_up(item: Item):
	get_parent().on_item_picked_up(item)
