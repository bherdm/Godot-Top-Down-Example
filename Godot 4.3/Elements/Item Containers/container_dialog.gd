class_name ContainerDialog
extends PanelContainer

@export var slot_scene: PackedScene

@onready var player_inv_grid: GridContainer = %PlayerInvGrid
@onready var container_inv_grid: GridContainer = %ContainerInvGrid

func _on_close_button_button_up() -> void:
	close()

func open(player_inventory: Inventory, container_inventory: Inventory):
	show()
	
	#Clear previous opening
	for child in player_inv_grid.get_children():
		child.queue_free()
	for child in container_inv_grid.get_children():
		child.queue_free()
	
	#Populate grid containers
	for item_stack in player_inventory.get_contents():
		var slot: ItemSlot = slot_scene.instantiate()
		player_inv_grid.add_child(slot)
		slot.set_texture(item_stack)
	for item_stack in container_inventory.get_contents():
		var slot: ItemSlot = slot_scene.instantiate()
		container_inv_grid.add_child(slot)
		slot.set_texture(item_stack)

func close():
	hide()

func toggle_open_close(player_inventory: Inventory, container_inventory: Inventory):
	if visible:
		close()
	else:
		open(player_inventory, container_inventory)
