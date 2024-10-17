class_name Player
extends CharacterBody2D

const base_walk_speed = 50.0

var inventory:Inventory = Inventory.new()

func on_item_stack_picked_up(item_stack: ItemStackInstance):
	inventory.add_item(item_stack)

func _physics_process(delta: float) -> void:
	var SPEED
	if Input.is_action_pressed("Run"):
		SPEED = base_walk_speed * 2
	else:
		SPEED = base_walk_speed
	
	var h_direction := Input.get_axis("Left", "Right")
	if h_direction:
		velocity.x = h_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var v_direction := Input.get_axis("Up", "Down")
	if v_direction:
		velocity.y = v_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
