class_name ProximityArea
extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("add_prox_area"):
		area.add_prox_area(self)


func _on_area_exited(area: Area2D) -> void:
	if area.has_method("remove_prox_area"):
		area.remove_prox_area(self)
