class_name ItemContainer
extends StaticBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var inventory_size: int = 6
var inventory:Inventory = Inventory.new(inventory_size)

func _ready() -> void:
	for child in get_children():
		if child is ItemStackInstance:
			var newISI:ItemStackInstance = ItemStackInstance.new()
			newISI.item = child.item
			newISI.stack_count = child.stack_count
			inventory.add_item(newISI)
			child.queue_free()

func focus():
	sprite_2d.self_modulate = Color(1.2,1.2,1.2)

func unfocus():
	sprite_2d.self_modulate = Color(1,1,1)
