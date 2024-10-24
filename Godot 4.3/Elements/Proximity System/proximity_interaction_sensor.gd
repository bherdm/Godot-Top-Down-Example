class_name ProximityInteractionSensor
extends Node2D

var nearby_proximity_areas: Array[ProximityArea] = []
var nearest_prox_area: ProximityArea


func within_a_proximity_area() -> bool:
	if nearby_proximity_areas.size() > 0:
		return true
	else:
		return false

func add_prox_area(entered_prox_area: ProximityArea):
	nearby_proximity_areas.append(entered_prox_area)

func remove_prox_area(exited_prox_area: ProximityArea):
	set_area_focus(exited_prox_area, false)
	nearby_proximity_areas.erase(exited_prox_area)

func set_area_focus(area: ProximityArea, state: bool):
	if state:
		if area.get_parent().has_method("focus"):
			area.get_parent().focus()
	else:
		if area.get_parent().has_method("unfocus"):
				area.get_parent().unfocus()

func determine_nearest_prox_area() -> ProximityArea:
	var nearest_area_array_position: int
	var smallest_i_distance = 10000
	for i in nearby_proximity_areas.size():
		var npa_distance = global_position.distance_to(nearby_proximity_areas[i].global_position)
		if npa_distance < smallest_i_distance:
			smallest_i_distance = npa_distance
			nearest_area_array_position = i
	return nearby_proximity_areas[nearest_area_array_position]

func set_all_areas_to_unfocused():
	for area in nearby_proximity_areas:
		set_area_focus(area, false)

func _process(delta: float) -> void:
	if nearby_proximity_areas.size() != 0:
		nearest_prox_area = determine_nearest_prox_area()
		set_all_areas_to_unfocused()
		set_area_focus(nearest_prox_area, true)
