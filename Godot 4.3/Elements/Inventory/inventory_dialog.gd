class_name InventoryDialog
extends PanelContainer

@export var slot_scene: PackedScene
@onready var grid_container: GridContainer = %GridContainer

func _on_close_button_button_up() -> void:
	close()

func open(inventory: Inventory):
	show()
	
	for child in grid_container.get_children():
		child.queue_free()
	
	for item in inventory.get_contents():
		var slot: ItemSlot = slot_scene.instantiate()
		grid_container.add_child(slot)
		slot.set_texture(item)

func close():
	hide()

func toggle_open_close(inventory: Inventory):
	if visible:
		close()
	else:
		open(inventory)
