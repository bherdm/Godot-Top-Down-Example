extends Node2D

@export var item: Item
@export var count:int = 1

var item_stack: ItemStackInstance = ItemStackInstance.new()

func _ready() -> void:
	#Creates the transferable item_stack
	item_stack.item = item
	item_stack.stack_count = count
	
	#Creates the visual and sets up the signal from the visual's collision detection to the player
	var new_item: Area2D = item.pickup_scene.instantiate()
	add_child(new_item)
	new_item.area_entered.connect(pickup_item_area_entered)

func pickup_item_area_entered(area):
	if area.has_method("attempt_to_pickup_item"):
		if area.attempt_to_pickup_item(item_stack) == true:
			queue_free()
