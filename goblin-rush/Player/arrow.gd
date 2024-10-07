extends CharacterBody2D

# TODO: 

var speed = 50
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	look_at(get_global_mouse_position())
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.x = direction.x * speed
	velocity.y = direction.y * speed
	
	move_and_slide()


func _on_arrow_dmg_box_area_entered(area: Area2D) -> void:
	queue_free()
