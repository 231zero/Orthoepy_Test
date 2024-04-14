shader_type canvas_item;

uniform float speed = 0.25;
uniform bool is_menu = false;
uniform float angle = 0;

vec2 rotateUVmatrinx(vec2 uv, vec2 pivot, float rotation)
{
	mat2 rotation_matrix=mat2(	vec2(sin(rotation),-cos(rotation)),
								vec2(cos(rotation),sin(rotation))
								);
    uv -= pivot;
    uv= uv*rotation_matrix;
    uv += pivot;
    return uv;
}


void fragment() {
	vec4 test;
	
	if (is_menu == true) {
		test = texture(TEXTURE, UV+vec2(0, TIME * speed));
	} else {
		test = texture(TEXTURE, rotateUVmatrinx(UV, vec2(0), radians(angle))+vec2(TIME * speed, 0));
	};
	
	COLOR = vec4(test.r, test.g, test.b, test.a);
}
