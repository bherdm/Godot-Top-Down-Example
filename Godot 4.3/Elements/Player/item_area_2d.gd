extends Area2D

func on_item_stack_picked_up(item_stack: ItemStackInstance):
	get_parent().on_item_stack_picked_up(item_stack)
