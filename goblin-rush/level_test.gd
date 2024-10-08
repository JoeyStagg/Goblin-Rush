extends Node2D

@export var enemies_per_round : int = 15
@export var enemies_added_per_round : int = 5

var round : int = 1
var enemies_spawned = 0

@onready var enemies = $Enemies
@onready var player = $player
@onready var spawners = $Spawners
@onready var timer = $Timer
@onready var game_ui = $CanvasLayer/GameUI


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
	if enemies_spawned < enemies_per_round:
		# Pick a random spawner to spawn an enemy
		var spawner = spawners.get_children().pick_random()
		spawner.spawn_enemy().enemy_killed.connect(end_round)
		enemies_spawned += 1


func _on_timer_timeout():
	timer.start()
	spawn_enemy()


func end_round():
	# This is kinda messy rn ngl, the reason we check if there's 1 enemy left is because
	# the signal that calls this function is run before the enemy actually dies.
	# It may be good to handle this differently later.
	if enemies_spawned == enemies_per_round && enemies.get_children().size() == 1:
		enemies_per_round += enemies_added_per_round
		enemies_spawned = 0
		round += 1
		game_ui.start_new_round(round)
