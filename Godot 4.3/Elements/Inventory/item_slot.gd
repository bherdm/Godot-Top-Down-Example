class_name ItemSlot
extends PanelContainer

@onready var texture_rect: TextureRect = %TextureRect

func set_texture(item: Item):
	texture_rect.texture = item.inv_atlas
