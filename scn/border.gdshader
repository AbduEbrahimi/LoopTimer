shader_type canvas_item;

uniform vec4 color1 = vec4(0.0, 0.56, 0.57, 1.0);
uniform vec4 color2 = vec4(0.9, 0.8, 0.2, 1.0);
uniform vec4 color3 = vec4(0.2, 0.1, 0.8, 1.0);
uniform float speed = 1.0;

void fragment() {
    vec2 dir = vec2(cos(TIME * 0.2), sin(TIME * 0.3));
    float pos = dot(UV, dir);
    float t = fract(pos + TIME * speed * 0.1);
    
    vec4 color;
    if (t < 0.5) {
        color = mix(color1, color2, t * 2.0);
    } else {
        color = mix(color2, color3, (t - 0.5) * 2.0);
    }
    COLOR = color;
}
