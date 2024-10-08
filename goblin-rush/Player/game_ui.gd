extends Control

var current_round = 1

@onready var round_label = $RoundLabel
@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_new_round(new_round : int):
	current_round = new_round
	animation_player.play("NewRound")


func update_round_label():
	round_label.text = str("Round ", current_round)
