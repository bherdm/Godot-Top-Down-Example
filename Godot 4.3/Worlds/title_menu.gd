extends PanelContainer

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _ready() -> void:
	animation_player.play("Fade from black")

func _on_start_button_button_up() -> void:
	pass # Replace with function body.

func _on_quit_button_button_up() -> void:
	get_tree().quit()
