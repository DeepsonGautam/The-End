extends Node

@export var scroll_speed: float = 100.0 

var bg1: Sprite2D
var bg2: Sprite2D
var bg_height: float

func _ready():
	bg1 = $BG1
	bg2 = $BG2
	
	bg_height = bg2.texture.get_height() * bg2.scale.y
	
	bg2.position.y = 0
	bg1.position.y = -bg_height

func _process(delta):
	bg1.position.y += scroll_speed * delta
	bg2.position.y += scroll_speed * delta
	
	if bg1.position.y >= bg_height:
		bg1.position.y = bg2.position.y - bg_height
	
	if bg2.position.y >= bg_height:
		bg2.position.y = bg1.position.y - bg_height
