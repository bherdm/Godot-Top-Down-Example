class_name ItemSlot
extends PanelContainer

@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = %Label

func set_texture(item_stack: ItemStackInstance):
	texture_rect.texture = item_stack.item.inv_atlas
	if item_stack.stack_count == 1:
		label.hide()
	else:
		label.show()
		label.set_text(str(item_stack.stack_count))
