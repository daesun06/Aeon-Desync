shader_type canvas_item;
render_mode unshaded, blend_mix;
uniform vec4 outline_color : source_color = vec4(1.0, 0.6, 0.0, 1.0);
uniform int outline_size : hint_range(1, 5) = 2;                     
uniform float alpha_threshold : hint_range(0.0, 1.0, 0.01) = 0.1;   

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float a = tex.a;
    vec4 result = vec4(0.0);

    if (a <= alpha_threshold) {
        vec2 px = TEXTURE_PIXEL_SIZE;
        float maxa = 0.0;

        for (int x = -outline_size; x <= outline_size; x++) {
            for (int y = -outline_size; y <= outline_size; y++) {
                if (x == 0 && y == 0) continue;
                vec2 offs = vec2(float(x), float(y)) * px;
                maxa = max(maxa, texture(TEXTURE, UV + offs).a);
            }
        }

        if (maxa > alpha_threshold) {
            result = outline_color;
        }
    }

    COLOR = result;
}
