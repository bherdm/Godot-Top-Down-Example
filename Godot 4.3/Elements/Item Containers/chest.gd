class_name ItemContainer
extends StaticBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var inventory_size: int = 6
var inventory:Inventory = Inventory.new(inventory_size)

func focus():
	sprite_2d.self_modulate = Color(1.2,1.2,1.2)

func unfocus():
	sprite_2d.self_modulate = Color(1,1,1)
