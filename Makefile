PYTHON := python
MD5 := md5sum -c --quiet
RGBDS := rgbds

.SUFFIXES:
.PHONY: all clean crystal crystal11
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp

poketools := extras/pokemontools
gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) $(poketools)/scan_includes.py


crystal_obj := \
wram.o \
main.o \
lib/mobile/main.o \
home.o \
audio.o \
maps.o \
engine/events.o \
engine/credits.o \
data/egg_moves.o \
data/evos_attacks.o \
data/pokedex/entries.o \
misc/crystal_misc.o \
text/common_text.o \
gfx/pics.o

rgbds_files := ${RGBDS}/rgbasm ${RGBDS}/rgblink ${RGBDS}/rgbgfx ${RGBDS}/rgbfix

roms := crystal-wigglywoo.gbc

all: $(rgbds_files) $(roms)

rgbds: $(rgbds_files)

crystal: crystal-wigglywoo.gbc

clean:
	-rm -f $(roms) $(crystal_obj) $(crystal11_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)
	-make -C ${RGBDS} clean

compare: crystal-wigglywoo.gbc
	@$(MD5) roms.md5

${RGBDS}/rgb%:
	-make -C ${RGBDS}

%.asm: ;

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	${RGBDS}/rgbasm -o $@ $<

crystal-wigglywoo.gbc: $(crystal_obj)
	${RGBDS}/rgblink -n crystal-wigglywoo.sym -m crystal-wigglywoo.map -o $@ $^
	${RGBDS}/rgbfix -Cjv -i WWOO -k 01 -l 0x33 -m 0x10 -p 0 -n 3 -r 3 -t WIGGLYWOO $@

%.png: ;
%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.lz: % ; $(gfx) lz $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;
