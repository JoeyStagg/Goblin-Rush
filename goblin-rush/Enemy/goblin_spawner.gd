extends Node2D

@export var enemy : PackedScene = load("res://Enemy/enemy.tscn")
@export var enemy_collection : Node2D


func spawn_enemy():
	var new_enemy = enemy.instantiate()
	enemy_collection.add_child(new_enemy, true)
