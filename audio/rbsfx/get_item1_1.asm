SFX_Get_Item1_1:: ; 8192 (2:4192)
	musicheader 3, 5, SFX_Get_Item1_1_Ch1
	musicheader 1, 6, SFX_Get_Item1_1_Ch2
	musicheader 1, 7, SFX_Get_Item1_1_Ch3

SFX_Get_Item1_1_Ch1: ; ad77 (2:6d77)
	togglesfx
	tempo 256
	volume 119
	vibrato 6, (2<<4) + 6
	dutycycle 2

	notetype 4, (11<<4) + 1
	octave 3
	note G#, 2
	note G#, 2
	note G#, 2
	notetype 12, (11<<4) + 3
	octave 4
	note E_, 4
	endchannel

SFX_Get_Item1_1_Ch2: ; ad8e (2:6d8e)
	togglesfx
	vibrato 8, (2<<4) + 7
	dutycycle 2
	notetype 4, (12<<4) + 1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	notetype 12, (12<<4) + 3
	note B_, 4
	endchannel

SFX_Get_Item1_1_Ch3: ; ad9e (2:6d9e)
	togglesfx
	notetype 4, (1<<4) + 0
	octave 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype 12, (1<<4) + 0
	octave 4
	note B_, 2
	note __, 2
	endchannel
; 0xadae
