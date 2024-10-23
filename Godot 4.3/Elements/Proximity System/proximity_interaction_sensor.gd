class_name ProximityInteractionSensor
extends Node

var nearby_proximity_areas: Array[ProximityArea] = []

func add_prox_area(entered_prox_area: ProximityArea):
	nearby_proximity_areas.append(entered_prox_area)
	print(entered_prox_area.get_parent().name + " is nearby!")


func remove_prox_area(exited_prox_area: ProximityArea):
	nearby_proximity_areas.erase(exited_prox_area)
	print(exited_prox_area.get_parent().name + " is no longer nearby!")