extends CanvasLayer

@onready var player: Player = %Player
@onready var inventory_dialog: InventoryDialog = $InventoryDialog
@onready var container_dialog: ContainerDialog = $ContainerDialog

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Inventory"):
		inventory_dialog.toggle_open_close(player.inventory)
	
	if player.proximity_interaction_sensor.within_a_proximity_area():
		var container: ItemContainer = player.proximity_interaction_sensor.nearest_prox_area.get_parent()
		if Input.is_action_just_pressed("Interact"):
			container_dialog.toggle_open_close(player.inventory, container.inventory)
