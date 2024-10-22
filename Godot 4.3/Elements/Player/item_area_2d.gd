extends Area2D

func attempt_to_pickup_item(item_stack: ItemStackInstance) -> int:
	return get_parent().attempt_to_pickup_item(item_stack)
