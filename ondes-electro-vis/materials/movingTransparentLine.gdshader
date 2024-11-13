shader_type spatial;

uniform vec3 color_gap = vec3(0, 0, 1);
uniform float speed = 0.1;
uniform float angle = -1.0;

void fragment() {
	//float w = sin(12.0 * UV.y + 12.0 * UV.x + 1.0 * TIME) + 1.0;
	//float w = sin(UV.y/1.0+10.0 * UV.x+TIME)+1.0;
	float w = angle * 0.1 * sin(25.0 * UV.y + angle *  2.0 * TIME);
	float lineAShape = smoothstep(1.0 - clamp(distance(w + UV.x, 0.5) * 1.0, 0.0, 1.0), 1.0, 0.99);
	
	//float w = cos(angle) * UV.x + sin(angle) * UV.y - speed * TIME;
	//if (floor(mod(w * divisions, stripe_bias)) < 0.0001) {
	//if (floor(w * 2.0) < 0.0001) {
	//if 
		//ALBEDO = color_gap;
		//EMISSION = color_gap;
	//} else {
		//ALPHA = 0.0;
	//}
	ALPHA = 1.0-lineAShape;
	if (lineAShape > 0.5) {
		ALPHA = 0.0;
	}
	else {
		ALPHA = 1.0;
	}
	ALBEDO = color_gap;
	EMISSION = color_gap;
}
