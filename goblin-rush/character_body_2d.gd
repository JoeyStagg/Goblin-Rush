extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 100.0	

func you_should_kill_yourself_now():
	queue_free()
	
	

func _physics_process(delta: float) -> void:
	

	if health <= 0:
		you_should_kill_yourself_now()
		
	if Input.is_action_pressed("run"):
		SPEED = 500.0
	else:
		SPEED = 300.0
		
	if Input.is_action_just_pressed("die"):
		you_should_kill_yourself_now()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_player_hitbox_area_entered(area: Area2D) -> void:
	health -= 33
	print(health)
