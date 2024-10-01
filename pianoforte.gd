extends Node2D

var key_scn:PackedScene=preload("res://pianokey.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0,88):
		$Keys.add_child(key_scn.instantiate().with_code(i))
		pass
	$Keys.position.x=-Pianokey.key_width*18
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		var rela_pos=event.position-position
		#超出范围则不处理
		if !(rela_pos.y<0||rela_pos.y>Pianokey.key_height):
			#处理拉动范围
			if abs(event.screen_velocity.x)>200.0:
				$Keys.position.x+=event.screen_relative.x
				if($Keys.position.x)>0:
					$Keys.position.x=0
				if($Keys.position.x)<-88*Pianokey.key_width+DisplayServer.window_get_size(0).x:
					$Keys.position.x=-88*Pianokey.key_width+DisplayServer.window_get_size(0).x;
