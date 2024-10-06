extends Node2D

@export var max_enemies = 10

@onready var enemies = $Enemies
@onready var player = $player
@onready var spawners = $Spawners
@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	for enemy in enemies.get_children():
		enemy.set_target(player.position)


func spawn_enemy():
	if enemies.get_children().size() < max_enemies:
		# Pick a random spawner to spawn an enemy
		var spawner = spawners.get_children().pick_random()
		spawner.spawn_enemy()


func _on_timer_timeout():
	timer.start()
	spawn_enemy()
