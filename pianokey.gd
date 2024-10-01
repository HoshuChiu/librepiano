extends Node2D
class_name Pianokey

const tune_name_sharp:Array=["C","#C","D","#D","E","F","#F","G","#G","A","#A","B"]
const tune_offset_count:Array=[0,0,1,1,2,3,3,4,4,5,5,6]
const tune_is_black:Array=[false,true,false,true,false,false,true,false,true,false,true,false]
const group_names:Array=["2","1"," "," ","1","2","3","4","5"]

const key_width:float=200
const key_height:float=700

var tune_code:int=0
var tune_group:int
var tune_name:int
var tune_name_str:String

func with_code(code:int) -> Pianokey:
	tune_code=code
	tune_group=floor((code+9)/12)
	tune_name=code+9-tune_group*12
	tune_name_str=tune_name_sharp[tune_name]
	if(tune_group>2):
		tune_name_str=tune_name_str.to_lower()
	return self

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var group_position_base:float=-5*key_width+7*key_width*tune_group
	position.x=group_position_base+tune_offset_count[tune_name]*key_width
	if(tune_is_black[tune_name]):
		z_index=1
		$BlackKey/TuneName.text=tune_name_str
		$BlackKey/Group.text=group_names[tune_group]
		$BlackKey.show()
	else:
		z_index=0
		$WhiteKey/TuneName.text=tune_name_str
		$WhiteKey/Group.text=group_names[tune_group]
		$WhiteKey.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
