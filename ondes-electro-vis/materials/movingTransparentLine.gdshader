shader_type spatial;

uniform vec3 color_gap = vec3(0, 0, 1);
uniform float divisions = 8.0;
uniform float stripe_bias = 2.5;
uniform float speed = 0.1;
uniform float angle = 0.7854;

void fragment() {
	float w = cos(angle) * UV.x + sin(angle) * UV.y - speed * TIME;
	if (floor(mod(w * divisions, stripe_bias)) < 0.0001) {
		ALBEDO = color_gap;
		EMISSION = color_gap;
	} else {
		ALPHA = 0.0;
	}
}
