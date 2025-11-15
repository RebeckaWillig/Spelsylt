extends AudioStreamPlayer
const background_music = preload("res://Assets/Audio/67RizzardOST.wav") as AudioStreamWAV

func _ready():
	process_mode = AudioStreamPlayer.PROCESS_MODE_ALWAYS

func play_music(music: AudioStream):
	if stream == background_music and is_playing():
		return
	stream = music
	play()

func play_background():
	$AnimationPlayer.play("RESET")
	play_music(background_music)

func fade_to_silence():
	$AnimationPlayer.play("fade_to_silence")
	await $AnimationPlayer.animation_finished
	stop()
