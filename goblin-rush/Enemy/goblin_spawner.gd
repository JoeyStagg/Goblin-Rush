extends Node2D

@export var enemy : PackedScene = load("res://Enemy/enemy.tscn")
@export var enemy_collection : Node2D


func spawn_enemy():
	var new_enemy = enemy.instantiate()
	new_enemy.position = position
	
	# Slightly randomize position
	var randomized_position = Vector2(randf_range(-32, 32), randf_range(-32, 32))
	new_enemy.position += randomized_position
	
	# Add the enemy node to the given collection
	enemy_collection.add_child(new_enemy, true)
	return new_enemy
