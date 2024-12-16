shader_type canvas_item;

uniform float yoffset = 0.5;
uniform float animation_speed = 0.5;
uniform vec4 flame_color : source_color = vec4(1.0);
uniform sampler2D noise_texture: hint_default_black, repeat_enable;

void fragment() {
	vec2 uv = vec2(UV.x, UV.y + TIME * animation_speed);
	vec4 noise_color = texture(noise_texture, uv);
	vec4 color = noise_color;
	color.rgb += vec3(UV.y - yoffset);
	color.rgb = step(color.rgb, vec3(0.5));
	color.rgb = vec3(1.0) - color.rgb;
	color.a = color.r;
	color.rgb = flame_color.rbg;
	COLOR = color;
}
	
