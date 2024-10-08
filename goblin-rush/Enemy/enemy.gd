extends CharacterBody2D

signal enemy_killed

@export var max_speed = 100 # Maximum speed goblins can move
@export var acceleration = 60 # The amount the goblin's speed increases when chasing
@export var friction = 50 # The amount the goblin's speed decreases when stopping
@export var turn_threshhold = 35 # Level of speed goblins need to change the direction it's looking
@export var points = 50 # Points gained per goblin killed

@onready var navigation_agent_2d = $NavigationAgent2D
@onready var gobby = $Gobby


func _physics_process(delta):
	if navigation_agent_2d.target_position && !navigation_agent_2d.is_target_reached():
		var direction = position.direction_to(navigation_agent_2d.get_next_path_position()).normalized()
		velocity.x = move_toward(velocity.x, direction.x * max_speed, acceleration)
		velocity.y = move_toward(velocity.y, direction.y * max_speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)
		velocity.y = move_toward(velocity.x, 0, friction)
	
	if abs(velocity.x) > turn_threshhold:
		gobby.flip_h = velocity.x > 0
	
	move_and_slide()


# This changes the goblin's target destination
func set_target(position : Vector2):
	navigation_agent_2d.target_position = position


# When the goblin detects another goblin, it computes a safe velocity to move to avoid it
func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity


func _on_hitbox_area_entered(area):
	emit_signal("enemy_killed")
	queue_free()
