extends CanvasLayer

@onready var player: Player = %Player
@onready var inventory_dialog: InventoryDialog = $InventoryDialog

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("Inventory"):
		inventory_dialog.toggle_open_close(player.inventory)
