shader_type canvas_item;

uniform bool white;

void fragment() {
    if (white) {
      vec4 color = texture(TEXTURE, UV);
      COLOR = vec4(1, 1, 1, color.a);
     }
}