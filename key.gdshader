shader_type canvas_item;
uniform vec4 border_color:source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	if(UV.x<0.02f || UV.x>0.98f){
		COLOR=border_color;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
