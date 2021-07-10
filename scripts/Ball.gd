extends KinematicBody

const THROW_VELOCITY_AWAY = 25
const THROW_VELOCITY_UP = 10
const GRAVITY = -30

var velocity = Vector3()

func _ready():
    pass
    
func _physics_process(delta):
    if get_translation().y < -1:
        queue_free()
        
    velocity.y += GRAVITY * delta
    
    move_and_slide(velocity)

func launch(rotation):    
    var x_param = THROW_VELOCITY_AWAY * sin(rotation.y)
    var z_param = THROW_VELOCITY_AWAY * cos(rotation.y)
    var y_param = 2 * THROW_VELOCITY_AWAY * sin(-rotation.x)
    
    velocity = Vector3(x_param, y_param, z_param)
