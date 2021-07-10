extends Control

func _ready():
    $"Panel/y axis checkbox".pressed = Config.getSetting("V_INVERT") == true
    $"Panel/Y sens slider".value = Config.getSetting("V_MOUSE_SENS")  

    $"Panel/x axis checkbox".pressed = Config.getSetting("H_INVERT") == true
    $"Panel/x sens slider".value = Config.getSetting("H_MOUSE_SENS")  
    
func _on_Button_pressed():
    get_tree().change_scene("res://scenes/World.tscn")
        
func _process(delta):
    if Input.is_action_pressed("exit"):
        get_tree().quit()

func _on_y_axis_checkbox_toggled(button_pressed):
    Config.updateSetting("V_INVERT", button_pressed)

func _on_Y_sens_slider_value_changed(value):
    Config.updateSetting("V_MOUSE_SENS", value)


func _on_x_sens_slider_value_changed(value):
    Config.updateSetting("H_MOUSE_SENS", value)

func _on_x_axis_checkbox_toggled(button_pressed):
    Config.updateSetting("H_INVERT", button_pressed)
