extends CharacterBody2D

# TODO: 

var speed = 300.0
var health = 100.0	

var mtn_dew_lvl = 0

@export var arrow: PackedScene

@onready var timer: Timer = $Timer
@onready var sprite = $player_texture


func you_should_kill_yourself_now():
	queue_free()


func _physics_process(delta: float) -> void:
	if health <= 0:
		you_should_kill_yourself_now()
	
	if Input.is_action_pressed("run"):
		speed = 500.0
	else:
		speed = 300.0
		
	if get_global_mouse_position().x > self.position.x:
		sprite.set_flip_h(true)
	else:
		sprite.set_flip_h(false)

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
	mtn_dew_lvl += 1
	timer.wait_time -= (timer.wait_time * .1)
	print(mtn_dew_lvl)
	print(timer.get_wait_time())


func shoot():
	if timer.is_stopped():
		var inst = arrow.instantiate()
		inst.transform = get_node("player_texture").global_transform
		inst.direction = inst.position.direction_to(get_global_mouse_position())
		owner.add_child(inst)
		timer.start()
