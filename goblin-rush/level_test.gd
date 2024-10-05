extends Node2D

@onready var enemies = $Enemies

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	for enemy in enemies.get_children():
		enemy.set_target(get_global_mouse_position())
