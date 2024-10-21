class_name ItemSlot
extends PanelContainer

@export var default_styleboxflat: StyleBoxFlat
@export var mouse_over_styleboxflat: StyleBoxFlat

@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = %Label

func _ready() -> void:
	set_default_styleboxflat()


func set_texture(item_stack: ItemStackInstance):
	texture_rect.texture = item_stack.item.inv_atlas
	if item_stack.stack_count == 1:
		label.hide()
	else:
		label.show()
		label.set_text(str(item_stack.stack_count))


func set_default_styleboxflat():
		add_theme_stylebox_override("panel", default_styleboxflat)

func set_mouse_over_styleboxflat():
	add_theme_stylebox_override("panel", mouse_over_styleboxflat)


func _on_mouse_entered() -> void:
	set_mouse_over_styleboxflat()

func _on_mouse_exited() -> void:
	set_default_styleboxflat()
