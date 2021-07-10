extends KinematicBody

onready var Ball = preload("res://scenes/Ball.tscn")

var captureMouse = false

var V_MOUSE_SENS
var H_MOUSE_SENS
var H_INVERT
var V_INVERT

func _ready():           
    V_MOUSE_SENS = Config.getSetting("V_MOUSE_SENS", 0.4) / 2
    H_MOUSE_SENS = Config.getSetting("H_MOUSE_SENS", 0.4)
    H_INVERT = -1 if Config.getSetting("H_INVERT", true) else 1
    V_INVERT = -1 if Config.getSetting("V_INVERT", false) else 1
    
func _input(event):
    if not captureMouse:
        if event is InputEventMouse:
            Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
            captureMouse = true

    # x is vertical, y is horizontal            
    if event is InputEventMouseMotion:
        rotation_degrees.y -= H_INVERT * H_MOUSE_SENS * event.relative.x
        rotation_degrees.x -= -V_INVERT * V_MOUSE_SENS * event.relative.y
        rotation_degrees.y = clamp(rotation_degrees.y, -90, 90)
        rotation_degrees.x = clamp(rotation_degrees.x, -45, 20)

        
func _process(delta):
    if Input.is_action_pressed("exit"):
        get_tree().quit()
        
    if Input.is_action_pressed("menu"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
        get_tree().change_scene("res://scenes/Menu.tscn")
        
        
    if Input.is_action_just_pressed("throw_ball"):
        shoot()

func shoot():
    var b = Ball.instance()
    owner.add_child(b)
    b.transform = $spawn_point.global_transform
    b.launch(rotation)
    
