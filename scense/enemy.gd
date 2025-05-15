extends RigidBody2D

@onready var game_manegers = %GameManegers  # تأكد من كتابة الاسم بشكل صحيح!

func _on_area_2d_body_entered(body):
    if body.name == "CharacterBody2D":
        var y_delta = position.y - body.position.y
        var x_delta = body.position.x - position.x

        # تأكد إنه عند اللاعب متغير velocity (ضيفه إذا مش موجود)
        if y_delta > 10 and body.velocity.y > 0:
            print("Destroy enemy")
            queue_free()  # موت العدو
            game_manegers.add_point()  # أضف نقطة
            if body.has_method("jump"):
                body.jump()  # خليه يرجع ينط بعد قتل العدو
        else:
            print("Destroy player health")
            game_manegers.decrease_health()
            if x_delta > 0:
                if body.has_method("jump_side"):
                    body.jump_side()
            else:
                if body.has_method("jump_side"):
                    body.jump_side()
