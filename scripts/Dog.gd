extends Area

onready var anim_player = $AnimationPlayer
onready var timer = $Timer

signal caught_ball

var caught_one = false;

func _ready():
    anim_player.play("appear")
    
func _on_Dog_body_entered(body):
    if !caught_one:
        body.queue_free()
        anim_player.play("catch")
        caught_one = true
        timer.start()

func _on_Timer_timeout():
    queue_free()
    emit_signal("caught_ball")
