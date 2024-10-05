extends CharacterBody2D

#TODO: make arrow move

var location = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	pass


func _on_arrow_dmg_box_area_entered(area: Area2D) -> void:
	queue_free()
