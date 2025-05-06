extends Node3D


var camerainbody_h: int = 0
var camerainbody_v: int = 0

@export var cam_v_max: int = 75
@export var cam_v_min: int = -55

var h_sensitivity: float=0.01
var v_sensitivity: float=0.01

var h_acceleration: float = 10.0
var v_acceleration: float = 10.0

func _ready() ->void:
	Input.set_mouse_mode(Input.Mouse_MODE)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camerainbody_h += -event.relative.x * h_sensitivity
		camerainbody_v +=  event.relative.y * v_sensitivity
		
func _physics_process(delta:float) -> void:
	camerainbody_v = clamp(camerainbody_v, deg_to_rad(cam_v_min),deg_to_rad(cam_v_max))
	get_node("h").rotation.y = lerpf(get_node("h").rotation.y,camerainbody_h, delta * h_acceleration)
	get_node("h/v").rotation.x = lerpf(get_node("h/v").rotation.x,camerainbody_v, delta * v_acceleration)
		
