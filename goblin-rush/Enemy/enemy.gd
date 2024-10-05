extends CharacterBody2D


const SPEED = 100.0

@onready var navigation_agent_2d = $NavigationAgent2D


func _physics_process(delta):
	if navigation_agent_2d.target_position && !navigation_agent_2d.is_target_reached():
		var direction = position.direction_to(navigation_agent_2d.get_next_path_position()).normalized()
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func set_target(position : Vector2):
	navigation_agent_2d.target_position = position
