extends Label

func _ready():
    text = "0"
    
func _on_score_increase(score):
    text = String(score)
