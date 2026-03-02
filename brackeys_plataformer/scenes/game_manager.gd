extends Node


var score = 0

@onready var final_score_label: Label = $"../Text_In_World/FinalScore"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_points(points: int = 1) -> void:
	var old_score = score
	score += points
	print("Current score: ", score, " (", old_score, " + ", points, ")")
	final_score_label.text = "Congratulations! You've reached the end!\n\nCoins collected: " + str(score)
