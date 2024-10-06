extends CharacterBody2D

# TODO: Limit the arrow shooting capabilities a bit so the arrows don't blot out the sun lol

var speed = 300.0
var health = 100.0	

@export var arrow: PackedScene


func you_should_kill_yourself_now():
	queue_free()


func _physics_process(delta: float) -> void:
	if health <= 0:
		you_should_kill_yourself_now()
	
	if Input.is_action_pressed("run"):
		speed = 500.0
	else:
		speed = 300.0
		
	look_at(get_global_mouse_position())
		
	if Input.is_action_pressed("shoot"):
		shoot()
	
	if Input.is_action_just_pressed("die"):
		you_should_kill_yourself_now()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()


func _on_player_hitbox_area_entered(area: Area2D) -> void:
	health -= 33
	print(health)


func shoot():
	var inst = arrow.instantiate()
	owner.add_child(inst)
	inst.transform = get_node("player_texture").global_transform
