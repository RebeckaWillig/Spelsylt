extends AudioStreamPlayer
const background_music = preload("res://Assets/Audio/GildedCage.wav")

func play_music(music: AudioStream):
	if stream == music:
		return
	stream = music
	play()

func play_background():
	play_music(background_music)

func fade_to_silence():
	$AnimationPlayer.play("fade_to_silence")
