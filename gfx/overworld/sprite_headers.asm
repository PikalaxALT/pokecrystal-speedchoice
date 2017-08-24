; Format:
;	Address
;	Length, Bank
;	Type, Palette

sprite_header: MACRO
; pointer, length, type, palette
	dw \1
	db \2 * 4 tiles, BANK(\1)
	db \3, \4
ENDM

ChrisSprite: ; 14736
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1473c

ChrisBikeSprite: ; 1473c
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14742

GameboyKidSprite: ; 14742
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 14748

SilverSprite: ; 14748
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1474e

OakSprite: ; 1474e
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14754

RedSprite: ; 14754
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1475a

BlueSprite: ; 1475a
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14760

BillSprite: ; 14760
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14766

ElderSprite: ; 14766
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1476c

JanineSprite: ; 1476c
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14772

KurtSprite: ; 14772
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14778

MomSprite: ; 14778
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1477e

BlaineSprite: ; 1477e
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14784

RedsMomSprite: ; 14784
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1478a

DaisySprite: ; 1478a
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14790

ElmSprite: ; 14790
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14796

WillSprite: ; 14796
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 1479c

FalknerSprite: ; 1479c
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147a2

WhitneySprite: ; 147a2
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147a8

BugsySprite: ; 147a8
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147ae

MortySprite: ; 147ae
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147b4

ChuckSprite: ; 147b4
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147ba

JasmineSprite: ; 147ba
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147c0

PryceSprite: ; 147c0
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147c6

ClairSprite: ; 147c6
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147cc

BrockSprite: ; 147cc
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147d2

KarenSprite: ; 147d2
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 147d8

BrunoSprite: ; 147d8
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147de

MistySprite: ; 147de
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147e4

LanceSprite: ; 147e4
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147ea

SurgeSprite: ; 147ea
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147f0

ErikaSprite: ; 147f0
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147f6

KogaSprite: ; 147f6
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 147fc

SabrinaSprite: ; 147fc
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14802

CooltrainerMSprite: ; 14802
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14808

CooltrainerFSprite: ; 14808
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1480e

BugCatcherSprite: ; 1480e
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14814

TwinSprite: ; 14814
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1481a

YoungsterSprite: ; 1481a
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14820

LassSprite: ; 14820
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14826

TeacherSprite: ; 14826
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1482c

BuenaSprite: ; 1482c
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14832

SuperNerdSprite: ; 14832
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14838

RockerSprite: ; 14838
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1483e

PokefanMSprite: ; 1483e
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14844

PokefanFSprite: ; 14844
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1484a

GrampsSprite: ; 1484a
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14850

GrannySprite: ; 14850
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14856

SwimmerGuySprite: ; 14856
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1485c

SwimmerGirlSprite: ; 1485c
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14862

BigSnorlaxSprite: ; 14862
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 14868

SurfingPikachuSprite: ; 14868
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1486e

RocketSprite: ; 1486e
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14874

RocketGirlSprite: ; 14874
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1487a

NurseSprite: ; 1487a
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 14880

LinkReceptionistSprite: ; 14880
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14886

ClerkSprite: ; 14886
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1488c

FisherSprite: ; 1488c
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14892

FishingGuruSprite: ; 14892
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14898

ScientistSprite: ; 14898
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1489e

KimonoGirlSprite: ; 1489e
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148a4

SageSprite: ; 148a4
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148aa

UnusedGuySprite: ; 148aa
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 148b0

GentlemanSprite: ; 148b0
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148b6

BlackBeltSprite: ; 148b6
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148bc

ReceptionistSprite: ; 148bc
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148c2

OfficerSprite: ; 148c2
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148c8

CalSprite: ; 148c8
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148ce

SlowpokeSprite: ; 148ce
	sprite_header SlowpokeSpriteGFX, 1, STILL_SPRITE, PAL_OW_RED
; 148d4

CaptainSprite: ; 148d4
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148da

BigLaprasSprite: ; 148da
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 148e0

GymGuySprite: ; 148e0
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148e6

SailorSprite: ; 148e6
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148ec

BikerSprite: ; 148ec
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148f2

PharmacistSprite: ; 148f2
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148f8

MonsterSprite: ; 148f8
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 148fe

FairySprite: ; 148fe
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14904

BirdSprite: ; 14904
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1490a

DragonSprite: ; 1490a
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14910

BigOnixSprite: ; 14910
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 14916

N64Sprite: ; 14916
	sprite_header N64SpriteGFX, 1, STILL_SPRITE, PAL_OW_BROWN
; 1491c

SudowoodoSprite: ; 1491c
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 14922

SurfSprite: ; 14922
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14928

PokeBallSprite: ; 14928
	sprite_header PokeBallSpriteGFX, 1, STILL_SPRITE, PAL_OW_RED
; 1492e

PokedexSprite: ; 1492e
	sprite_header PokedexSpriteGFX, 1, STILL_SPRITE, PAL_OW_BROWN
; 14934

PaperSprite: ; 14934
	sprite_header PaperSpriteGFX, 1, STILL_SPRITE, PAL_OW_BLUE
; 1493a

VirtualBoySprite: ; 1493a
	sprite_header VirtualBoySpriteGFX, 1, STILL_SPRITE, PAL_OW_RED
; 14940

OldLinkReceptionistSprite: ; 14940
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 14946

RockSprite: ; 14946
	sprite_header RockSpriteGFX, 1, STILL_SPRITE, PAL_OW_ROCK
; 1494c

BoulderSprite: ; 1494c
	sprite_header BoulderSpriteGFX, 1, STILL_SPRITE, PAL_OW_ROCK
; 14952

SnesSprite: ; 14952
	sprite_header SnesSpriteGFX, 1, STILL_SPRITE, PAL_OW_BLUE
; 14958

FamicomSprite: ; 14958
	sprite_header FamicomSpriteGFX, 1, STILL_SPRITE, PAL_OW_RED
; 1495e

FruitTreeSprite: ; 1495e
	sprite_header FruitTreeSpriteGFX, 1, STILL_SPRITE, PAL_OW_TREE
; 14964

GoldTrophySprite: ; 14964
	sprite_header GoldTrophySpriteGFX, 1, STILL_SPRITE, PAL_OW_BROWN
; 1496a

SilverTrophySprite: ; 1496a
	sprite_header SilverTrophySpriteGFX, 1, STILL_SPRITE, PAL_OW_SILVER
; 14970

KrisSprite: ; 14970
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 14976

KrisBikeSprite: ; 14976
	sprite_header WigglywooSpriteGFX, 3, WALKING_SPRITE, PAL_OW_BLUE
; 1497c

KurtOutsideSprite: ; 1497c
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 14982

SuicuneSprite: ; 14982
	sprite_header SuicuneSpriteGFX, 1, STILL_SPRITE, PAL_OW_BLUE
; 14988

EnteiSprite: ; 14988
	sprite_header EnteiSpriteGFX, 1, STILL_SPRITE, PAL_OW_RED
; 1498e

RaikouSprite: ; 1498e
	sprite_header RaikouSpriteGFX, 1, STILL_SPRITE, PAL_OW_RED
; 14994

StandingYoungsterSprite: ; 14994
	sprite_header WigglywooSpriteGFX, 3, STANDING_SPRITE, PAL_OW_BLUE
; 1499a
