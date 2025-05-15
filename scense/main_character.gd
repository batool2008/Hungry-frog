extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite = $Sprite2D

func jump_side():
        velocity.y = JUMP_VELOCITY

var coins_collected: int = 0  # هنا نحفظ عدد العملات

func _physics_process(delta: float) -> void:
    # Add the gravity.
    if not is_on_floor():
        velocity += get_gravity() * delta

    # Handle jump.
    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    # Get the input direction and handle the movement/deceleration.
    var direction := Input.get_axis("ui_left", "ui_right")
    if direction:
        velocity.x = direction * SPEED
        # Flip sprite based on direction
        sprite.flip_h = direction < 0
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()

# دالة استقبال العملات من العملة نفسها
func add_coins(amount: int) -> void:
    coins_collected += amount
    print("جمعت العملات: ", coins_collected)
