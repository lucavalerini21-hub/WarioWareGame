extends TextureRect

var current_frame: int = 0
var timer: float = 0.0
@export var frame_duration: float = 0.1

func _ready() -> void:
	print("--- TEST AVVIATO ---")
	if texture is AtlasTexture:
		print("✅ La texture è correttamente una AtlasTexture!")
	else:
		print("❌ ERRORE: La texture NON è una AtlasTexture! Tipo attuale: ", texture)

func _process(delta: float) -> void:
	timer += delta
	if timer >= frame_duration:
		timer = 0.0
		current_frame = (current_frame + 1) % 4
		
		if texture is AtlasTexture:
			var atlas := texture as AtlasTexture
			atlas.region = Rect2(current_frame * 256, 0, 256, 256)
			print("Frame cambiato a: ", current_frame, " (X: ", current_frame * 256, ")")
