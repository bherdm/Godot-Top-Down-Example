extends Node

var current_world

var next_world
var load_status = 0
var load_progress = []
var change_worlds_when_loaded: bool

func _ready() -> void:
	set_process(false)

func start_new_world_preloading(new_next_world: String, change_worlds_asap: bool):
	next_world = new_next_world
	change_worlds_when_loaded = change_worlds_asap
	ResourceLoader.load_threaded_request(next_world)
	set_process(true)

func _process(_delta: float) -> void:
	load_next_world()

func load_next_world():
	load_status = ResourceLoader.load_threaded_get_status(next_world, load_progress)
	if change_worlds_when_loaded && load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var newScene = ResourceLoader.load_threaded_get(next_world)
		get_tree().change_scene_to_packed(newScene)
		set_process(false)
