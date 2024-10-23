class_name ProximityInteractionSensor
extends Node

var nearby_proximity_areas: Array[ProximityArea] = []

func within_a_proximity_area() -> bool:
	if nearby_proximity_areas.size() > 0:
		return true
	else:
		return false

func add_prox_area(entered_prox_area: ProximityArea):
	nearby_proximity_areas.append(entered_prox_area)

func remove_prox_area(exited_prox_area: ProximityArea):
	nearby_proximity_areas.erase(exited_prox_area)
	if exited_prox_area.get_parent().has_method("unfocus"):
			exited_prox_area.get_parent().unfocus()

func _process(delta: float) -> void:
	for area in nearby_proximity_areas:
		if area.get_parent().has_method("focus"):
			area.get_parent().focus()
