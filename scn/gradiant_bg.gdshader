shader_type canvas_item;

uniform vec4 color1 = vec4(0.1, 0.2, 0.4, 1.0);
uniform vec4 color2 = vec4(0.3, 0.5, 0.7, 1.0);
uniform vec4 color3 = vec4(0.6, 0.7, 0.8, 1.0);
uniform vec4 color4 = vec4(0.8, 0.7, 0.6, 1.0);
uniform vec4 color5 = vec4(0.6, 0.4, 0.5, 1.0);
uniform vec4 color6 = vec4(0.2, 0.2, 0.3, 1.0);
uniform float speed = 0.2;

void fragment() {
    vec2 dir = vec2(cos(TIME * 0.04), sin(TIME * 0.06));
    float pos = dot(UV, dir);
    float t = fract(pos + TIME * speed * 0.1);
    
    // قرار دادن رنگ‌ها در یک آرایه محلی
    vec4 colors[6];
    colors[0] = color1;
    colors[1] = color2;
    colors[2] = color3;
    colors[3] = color4;
    colors[4] = color5;
    colors[5] = color6;
    
    int num_colors = 6;
    float segment = 1.0 / float(num_colors - 1);
    
    float idx_f = t * float(num_colors - 1);
    int idx1 = int(floor(idx_f));
    int idx2 = min(idx1 + 1, num_colors - 1);
    float frac = idx_f - floor(idx_f);
    
    float softened = smoothstep(0.0, 1.0, frac);
    vec4 color = mix(colors[idx1], colors[idx2], softened);
    COLOR = color;
}