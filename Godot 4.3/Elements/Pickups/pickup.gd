extends Node2D

@export var item: Item

func _ready() -> void:
	var new_item: Area2D = item.pickup_scene.instantiate()
	add_child(new_item)
	new_item.area_entered.connect(pickup_item_area_entered)

func pickup_item_area_entered(area):
	if area.has_method("on_item_picked_up"):
		area.on_item_picked_up(item)
		queue_free()
