extends Node

@onready var points_label = %PointsLabel
@export var hearts : Array[Node]  # هذه يتم تعبئتها من داخل المحرر

var lives = 3
var score = 0

func _ready():
    points_label.text = "points: " + str(score)

func decrease_health():
    lives -= 1
    print(lives)
    if lives==2:
      $"../UI/Hearts/Heart".visible = false
    if lives==1:
     $"../UI/Hearts/Heart2".visible = false
    if lives==0:
     $"../UI/Hearts/Heart3".visible = false
    for h in range(hearts.size()):
        if h < lives:
            hearts[h].show()
        else:
            hearts[h].hide()
    
    if lives == 0:
        get_tree().reload_current_scene()

func add_point():
    score += 1
    print("Score is now: ", score)
    points_label.text = "points: " + str(score)
