GetLandmarkCoords: ; 0x1ca896
; Return coordinates (d, e) of landmark e.
	push hl
	ld l, e
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret
; 0x1ca8a5


GetLandmarkName:: ; 0x1ca8a5
; Copy the name of landmark e to StringBuffer1.
	push hl
	push de
	push bc

	ld l, e
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Landmarks + 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, StringBuffer1
	ld c, 18
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	pop bc
	pop de
	pop hl
	ret
; 0x1ca8c3


Landmarks:: ; 0x1ca8c3

landmark: MACRO
	db \1, \2
	dw \3
ENDM

	landmark   0,   0, SpecialMapName
	landmark 148, 116, NewBarkTownName
	landmark 136, 116, Route29Name
	landmark 108, 116, CherrygroveCityName
	landmark 108,  96, Route30Name
	landmark 104,  76, Route31Name
	landmark  92,  76, VioletCityName
	landmark  93,  74, SproutTowerName
	landmark  92, 108, Route32Name
	landmark  84,  92, RuinsOfAlphName
	landmark  92, 140, UnionCaveName
	landmark  90, 140, Route33Name
	landmark  76, 140, AzaleaTownName
	landmark  78, 138, SlowpokeWellName
	landmark  60, 136, IlexForestName
	landmark  60, 128, Route34Name
	landmark  60, 108, GoldenrodCityName
	landmark  58, 108, RadioTowerName
	landmark  60,  92, Route35Name
	landmark  60,  76, NationalParkName
	landmark  72,  76, Route36Name
	landmark  76,  68, Route37Name
	landmark  76,  60, EcruteakCityName
	landmark  78,  58, TinTowerName
	landmark  74,  58, BurnedTowerName
	landmark  60,  60, Route38Name
	landmark  44,  64, Route39Name
	landmark  44,  76, OlivineCityName
	landmark  46,  78, LighthouseName
	landmark  36,  72, BattleTowerName
	landmark  36,  80, Route40Name
	landmark  36, 108, WhirlIslandsName
	landmark  36, 116, Route41Name
	landmark  28, 116, CianwoodCityName
	landmark 100,  60, Route42Name
	landmark  92,  60, MtMortarName
	landmark 116,  60, MahoganyTownName
	landmark 116,  52, Route43Name
	landmark 116,  44, LakeOfRageName
	landmark 128,  60, Route44Name
	landmark 138,  54, IcePathName
	landmark 140,  60, BlackthornCityName
	landmark 140,  52, DragonsDenName
	landmark 140,  80, Route45Name
	landmark 120,  88, DarkCaveName
	landmark 132, 104, Route46Name
	landmark 156,  84, SilverCaveName
	landmark  60, 124, PalletTownName
	landmark  60, 108, Route1Name
	landmark  60,  92, ViridianCityName
	landmark  60,  80, Route2Name
	landmark  60,  68, PewterCityName
	landmark  72,  68, Route3Name
	landmark  84,  68, MtMoonName
	landmark  96,  68, Route4Name
	landmark 108,  68, CeruleanCityName
	landmark 108,  60, Route24Name
	landmark 116,  52, Route25Name
	landmark 108,  76, Route5Name
	landmark 116,  92, UndergroundName
	landmark 108,  92, Route6Name
	landmark 108, 100, VermilionCityName
	landmark  96,  76, DiglettsCaveName
	landmark  96,  84, Route7Name
	landmark 124,  84, Route8Name
	landmark 124,  68, Route9Name
	landmark 140,  68, RockTunnelName
	landmark 140,  72, Route10Name
	landmark 140,  76, PowerPlantName
	landmark 140,  84, LavenderTownName
	landmark 148,  84, LavRadioTowerName
	landmark  84,  84, CeladonCityName
	landmark 108,  84, SaffronCityName
	landmark 124, 100, Route11Name
	landmark 140,  96, Route12Name
	landmark 132, 116, Route13Name
	landmark 124, 128, Route14Name
	landmark 112, 132, Route15Name
	landmark  76,  84, Route16Name
	landmark  76, 108, Route17Name
	landmark  88, 132, Route18Name
	landmark 100, 132, FuchsiaCityName
	landmark 100, 144, Route19Name
	landmark  84, 148, Route20Name
	landmark  76, 148, SeafoamIslandsName
	landmark  60, 148, CinnabarIslandName
	landmark  60, 136, Route21Name
	landmark  44,  84, Route22Name
	landmark  36,  68, VictoryRoadName
	landmark  36,  60, Route23Name
	landmark  36,  52, IndigoPlateauName
	landmark  36, 108, Route26Name
	landmark  28, 116, Route27Name
	landmark  20, 116, TohjoFallsName
	landmark  28,  84, Route28Name
	landmark 148, 132, FastShipName


NewBarkTownName:     db "WIGGLYWOO@"
CherrygroveCityName: db "WIGGLYWOO@"
VioletCityName:      db "WIGGLYWOO@"
AzaleaTownName:      db "WIGGLYWOO@"
GoldenrodCityName:   db "WIGGLYWOO@"
EcruteakCityName:    db "WIGGLYWOO@"
OlivineCityName:     db "WIGGLYWOO@"
CianwoodCityName:    db "WIGGLYWOO@"
MahoganyTownName:    db "WIGGLYWOO@"
BlackthornCityName:  db "WIGGLYWOO@"
LakeOfRageName:      db "WIGGLYWOO@"
SilverCaveName:      db "WIGGLYWOO@"
SproutTowerName:     db "WIGGLYWOO@"
RuinsOfAlphName:     db "WIGGLYWOO@"
UnionCaveName:       db "WIGGLYWOO@"
SlowpokeWellName:    db "WIGGLYWOO@"
RadioTowerName:      db "WIGGLYWOO@"
PowerPlantName:      db "WIGGLYWOO@"
NationalParkName:    db "WIGGLYWOO@"
TinTowerName:        db "WIGGLYWOO@"
LighthouseName:      db "WIGGLYWOO@"
WhirlIslandsName:    db "WIGGLYWOO@"
MtMortarName:        db "WIGGLYWOO@"
DragonsDenName:      db "WIGGLYWOO@"
IcePathName:         db "WIGGLYWOO@"
NotApplicableName:   db "WIGGLYWOO@"
PalletTownName:      db "WIGGLYWOO@"
ViridianCityName:    db "WIGGLYWOO@"
PewterCityName:      db "WIGGLYWOO@"
CeruleanCityName:    db "WIGGLYWOO@"
LavenderTownName:    db "WIGGLYWOO@"
VermilionCityName:   db "WIGGLYWOO@"
CeladonCityName:     db "WIGGLYWOO@"
SaffronCityName:     db "WIGGLYWOO@"
FuchsiaCityName:     db "WIGGLYWOO@"
CinnabarIslandName:  db "WIGGLYWOO@"
IndigoPlateauName:   db "WIGGLYWOO@"
VictoryRoadName:     db "WIGGLYWOO@"
MtMoonName:          db "WIGGLYWOO@"
RockTunnelName:      db "WIGGLYWOO@"
LavRadioTowerName:   db "WIGGLYWOO@"
SilphCoName:         db "WIGGLYWOO@"
SafariZoneName:      db "WIGGLYWOO@"
SeafoamIslandsName:  db "WIGGLYWOO@"
PokemonMansionName:  db "WIGGLYWOO@"
CeruleanCaveNane:    db "WIGGLYWOO@"
Route1Name:          db "WIGGLYWOO@"
Route2Name:          db "WIGGLYWOO@"
Route3Name:          db "WIGGLYWOO@"
Route4Name:          db "WIGGLYWOO@"
Route5Name:          db "WIGGLYWOO@"
Route6Name:          db "WIGGLYWOO@"
Route7Name:          db "WIGGLYWOO@"
Route8Name:          db "WIGGLYWOO@"
Route9Name:          db "WIGGLYWOO@"
Route10Name:         db "WIGGLYWOO@"
Route11Name:         db "WIGGLYWOO@"
Route12Name:         db "WIGGLYWOO@"
Route13Name:         db "WIGGLYWOO@"
Route14Name:         db "WIGGLYWOO@"
Route15Name:         db "WIGGLYWOO@"
Route16Name:         db "WIGGLYWOO@"
Route17Name:         db "WIGGLYWOO@"
Route18Name:         db "WIGGLYWOO@"
Route19Name:         db "WIGGLYWOO@"
Route20Name:         db "WIGGLYWOO@"
Route21Name:         db "WIGGLYWOO@"
Route22Name:         db "WIGGLYWOO@"
Route23Name:         db "WIGGLYWOO@"
Route24Name:         db "WIGGLYWOO@"
Route25Name:         db "WIGGLYWOO@"
Route26Name:         db "WIGGLYWOO@"
Route27Name:         db "WIGGLYWOO@"
Route28Name:         db "WIGGLYWOO@"
Route29Name:         db "WIGGLYWOO@"
Route30Name:         db "WIGGLYWOO@"
Route31Name:         db "WIGGLYWOO@"
Route32Name:         db "WIGGLYWOO@"
Route33Name:         db "WIGGLYWOO@"
Route34Name:         db "WIGGLYWOO@"
Route35Name:         db "WIGGLYWOO@"
Route36Name:         db "WIGGLYWOO@"
Route37Name:         db "WIGGLYWOO@"
Route38Name:         db "WIGGLYWOO@"
Route39Name:         db "WIGGLYWOO@"
Route40Name:         db "WIGGLYWOO@"
Route41Name:         db "WIGGLYWOO@"
Route42Name:         db "WIGGLYWOO@"
Route43Name:         db "WIGGLYWOO@"
Route44Name:         db "WIGGLYWOO@"
Route45Name:         db "WIGGLYWOO@"
Route46Name:         db "WIGGLYWOO@"
DarkCaveName:        db "WIGGLYWOO@"
IlexForestName:      db "WIGGLYWOO@"
BurnedTowerName:     db "WIGGLYWOO@"
FastShipName:        db "WIGGLYWOO@"
ViridianForestName:  db "WIGGLYWOO@"
DiglettsCaveName:    db "WIGGLYWOO@"
TohjoFallsName:      db "WIGGLYWOO@"
UndergroundName:     db "WIGGLYWOO@"
BattleTowerName:     db "WIGGLYWOO@"
SpecialMapName:      db "WIGGLYWOO@"


RegionCheck: ; 0x1caea1
; Checks if the player is in Kanto or Johto.
; If in Johto, returns 0 in e.
; If in Kanto, returns 1 in e.
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP ; S.S. Aqua
	jr z, .johto
	cp SPECIAL_MAP
	jr nz, .checkagain

; In a special map, get the backup map group / map id
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.checkagain
	cp KANTO_LANDMARK
	jr c, .johto

; Victory Road area is considered to be Johto.
	cp VICTORY_ROAD
	jr c, .kanto

.johto
	ld e, 0
	ret
.kanto
	ld e, 1
	ret
