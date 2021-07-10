extends Node

const save_path = "user://config.cfg"

var config = ConfigFile.new()
var loaded = config.load(save_path)

func _ready():
    if getSetting("V_INVERT") == null:
        updateSetting("V_MOUSE_SENS", 0.1)
        updateSetting("H_MOUSE_SENS", 0.1)
        updateSetting("V_INVERT", true)
        updateSetting("H_INVERT", false)

        config.save(save_path)
    
func getSetting(name, default=null):
    return config.get_value("settings", name, default)

func updateSetting(name, value):
    config.set_value("settings", name, value)
    config.save(save_path)
