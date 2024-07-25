shader_type spatial;

varying vec3 pos;
void vertex() {	
    pos = mat3(MODEL_MATRIX) * -VERTEX;
    pos = pos - NODE_POSITION_WORLD;
}

void fragment() {
    if (pos.y >= 3.5) {
        ALBEDO = vec3(0., 0., 0.);
    }
    if (pos.y >= 2.5 && pos.y <= 3.5) {
        ALBEDO = vec3(0.07, 0.07, 0.07);
    }
	if (pos.y >= 1.5 && pos.y <= 2.5) {
        ALBEDO = vec3(0.1, 0.1, 0.1);
    }
	if (pos.y >= 0.5 && pos.y <= 1.5) {
        ALBEDO = vec3(0.15, 0.15, 0.15);
    }
	if (pos.y >= -0.5 && pos.y <= 0.5) {
        ALBEDO = vec3(0.2, 0.2, 0.2);
    }
	if (pos.y >= -1.5 && pos.y <= -0.5) {
        ALBEDO = vec3(0.3, 0.3, 0.3);
    }
	if (pos.y >= -2.5 && pos.y <= -1.5) {
        ALBEDO = vec3(0.4, 0.4, 0.4);
    }
	if (pos.y >= -3.5 && pos.y <= -2.5) {
        ALBEDO = vec3(0.6, 0.6, 0.6);
    }
}