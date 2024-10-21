extends Area2D

func attempt_to_pickup_item(item_stack: ItemStackInstance) -> bool:
	return get_parent().attempt_to_pickup_item(item_stack)
