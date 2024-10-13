extends Control

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var next_scene = "res://Worlds/title_menu.tscn"

func _ready() -> void:
	SceneLoader.start_new_world_preloading(next_scene, false)
	animation_player.play("SplashSequence")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	SceneLoader.change_worlds_when_loaded = true

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		SceneLoader.change_worlds_when_loaded = true
	if event is InputEventMouseButton and event.pressed:
		SceneLoader.change_worlds_when_loaded = true
