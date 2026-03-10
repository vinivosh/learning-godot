extends Area2D


@onready var game_mngr: Node = %GameManager
@onready var anim_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(_body: Node2D) -> void:
	game_mngr.add_points(1)
	anim_player.play("CoinPickUp")
