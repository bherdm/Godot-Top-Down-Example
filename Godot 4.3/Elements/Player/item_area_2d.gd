extends Area2D

@onready var proximity_interaction_sensor: ProximityInteractionSensor = %Proximity_Interaction_Sensor

func attempt_to_pickup_item(item_stack: ItemStackInstance) -> int:
	return get_parent().attempt_to_pickup_item(item_stack)

func add_prox_area(entered_prox_area: ProximityArea):
	proximity_interaction_sensor.add_prox_area(entered_prox_area)

func remove_prox_area(exited_prox_area: ProximityArea):
	proximity_interaction_sensor.remove_prox_area(exited_prox_area)
