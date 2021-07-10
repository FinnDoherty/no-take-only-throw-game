extends Spatial

onready var Dog = preload("res://scenes/Dog.tscn")
onready var spawnLocations = [$Position3D1, $Position3D2, $Position3D3, $Position3D4, $Position3D5]

var spawnList = [1,2,3,4]
var lastSpawn = 0
var score = 0;

func _ready():    
    emit_signal("score_increase", 0)
    addDog(spawnLocations[0])
    randomize()
    
func _process(delta):
    pass
    
func on_caught_ball():
    score += 100
    get_node("Control/score_display")._on_score_increase(score)
    addRandomDog()
            
func addRandomDog():
    spawnList.shuffle()
    if spawnList.size() < 1:
        spawnList = [1,2,3,4]
        spawnList.shuffle()
    
    var spawnIndex = spawnList.pop_back()
    if spawnIndex == lastSpawn:
        spawnIndex = 0
    lastSpawn = spawnIndex
    
    addDog(spawnLocations[spawnIndex])
        
func addDog(spawnLocation):
    var d = Dog.instance()
    add_child(d)
    d.transform = spawnLocation.global_transform
    d.connect("caught_ball", self, "on_caught_ball")

func _on_Timer_timeout():
    Globals.score = score
    get_tree().change_scene("res://scenes/Game Over.tscn")
