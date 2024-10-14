extends PanelContainer

@onready var animation_player: AnimationPlayer = %AnimationPlayer

var play_scene: String = "res://Worlds/overworld.tscn"

func _ready() -> void:
	animation_player.play("Fade from black")

func _on_start_button_button_up() -> void:
	SceneLoader.start_new_world_preloading(play_scene, true)

func _on_quit_button_button_up() -> void:
	get_tree().quit()
