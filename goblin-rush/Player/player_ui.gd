extends CanvasLayer

@onready var progress_bar: ProgressBar = $Control/ProgressBar
@onready var label: Label = $Control/ProgressBar/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_emit_health(health: float) -> void:
	progress_bar.set_value(health)
	label.set_text(str(progress_bar.get_value()))
