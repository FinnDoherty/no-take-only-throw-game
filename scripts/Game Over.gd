extends Control

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    $score.text = String(Globals.score)

func _on_Button_pressed():
    get_tree().change_scene("res://scenes/World.tscn")
        
func _process(delta):
    if Input.is_action_pressed("exit"):
        get_tree().quit()
