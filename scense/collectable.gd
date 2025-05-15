extends Area2D
@onready var game_manegers = %GameManegers

func _on_body_entered(body):
    if body.name == "CharacterBody2D":
        game_manegers.add_point()
        queue_free()
