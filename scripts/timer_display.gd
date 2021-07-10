extends Label

func _process(delta):
    text = "%02d" % [int($Timer.time_left) % 60]
