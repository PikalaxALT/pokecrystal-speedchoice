#!/bin/python3

import argparse
import os

STARTERS = ['Cyndaquil', 'Totodile', 'Chikorita']
TUTORS = ['Flamethrower', 'Thunderbolt', 'IceBeam']
STATIC_POKES = ['Lapras',
                'Electrode1',
                'Electrode2',
                'Electrode3',
                'Lugia',
                'RedGyarados',
                'Sudowoodo',
                'Snorlax',
                'HoOh',
                'Suicune',
                'Voltorb',
                'Geodude',
                'Koffing',
                'Shuckle',
                'Tyrogue',
                'Togepi',
                'Kenya',
                'Eevee',
                'Dratini',
                'Raikou',
                'Entei',
                'Suicune',
                'Celebi']
GAME_CORNER = ['Abra',
               'Cubone',
               'Wobbuffet',
               'Pikachu',
               'Porygon',
               'Larvitar']


class Symfile(dict):
    @classmethod
    def from_fp(cls, fp):
        retval = cls()
        for line in fp:
            try:
                ptr, name = line.split()
                bank, addr = (int(x, 16) for x in ptr.split(':'))
                retval[name] = (bank << 14) | (addr & 0x3fff)
                # Because we can't tell from the SYM file whether a symbol
                # is actually is ROM or not, we just assume that it is in ROM.
            except ValueError:
                continue
        return retval


def fpeek(fp, size=1):
    tell = fp.tell()
    buff = fp.read(size)
    fp.seek(tell, os.SEEK_SET)
    return buff


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('rom', type=argparse.FileType('rb'))
    parser.add_argument('sym', type=argparse.FileType())
    parser.add_argument('out', type=argparse.FileType('w'))
    args = parser.parse_args()
    args.rom: IO
    args.sym: IO
    args.out: IO

    syms = Symfile.from_fp(args.sym)
    
    def setconfig(key, value):
        print('{}={}'.format(key, value), file=args.out)

    def set_symbol(key, sym, extra=0):
        setconfig(key, '0x{:X}'.format(syms[sym] + extra))
    
    def set_tm_text(num, key, txt):
        setconfig('TMText[]',
                  '[{:d},0x{:X},{}]'.format(num, syms[key] + 1, txt))

    # Print version
    args.rom.seek(0x14c)
    ver = int.from_bytes(args.rom.read(1), 'little')
    print('[Crystal SpeedChoice v{:d}]'.format(ver + 1), file=args.out)

    # Game code
    args.rom.seek(0x13f)
    code = args.rom.read(4).decode('ascii')
    setconfig('Game', code)
    setconfig('Version', str(ver))

    # Is Japanese?
    args.rom.seek(0x14a)
    jap = int.from_bytes(args.rom.read(1), 'little')
    setconfig('NonJapanese', str(jap))

    setconfig('Type', 'Crystal')
    setconfig('ExtraTableFile', 'gsc_english')

    set_symbol('PokemonNamesOffset', 'PokemonNames')
    setconfig('PokemonNamesLength', '10')
    set_symbol('PokemonStatsOffset', 'BaseData0')
    set_symbol('WildPokemonOffset', 'JohtoGrassWildMons')
    set_symbol('FishingWildsOffset', 'FishGroupShore_Old')
    set_symbol('HeadbuttWildsOffset', 'TreeMons1')
    setconfig('HeadbuttTableSize', 13)
    set_symbol('BCCWildsOffset', 'ContestMons')
    set_symbol('FleeingDataOffset', 'FleeMons')
    set_symbol('MoveDataOffset', 'MovesHMNerfs')
    set_symbol('MoveNamesOffset', 'MoveNamesNerfedHMs')
    set_symbol('ItemNamesOffset', 'ItemNames')
    set_symbol('PokemonMovesetsTableOffset', 'EvosAttacksPointers')
    setconfig('SupportsFourStartingMoves', str(1))
    for i, name in enumerate(STARTERS):
        key = 'Randomizer_Starter{}Offset{{:d}}'.format(name)
        offs = [syms[key.format(j + 1)] + 1 for j in range(4)]
        setconfig('StarterOffsets{:d}'.format(i + 1),
                  '[0x{:X}, 0x{:X}, 0x{:X}, 0x{:X}]'.format(*offs))
    offs = [syms['Randomizer_Starter{}Offset4'.format(starter)] + 3
            for starter in STARTERS]
    setconfig('StarterHeldItems',
              '[0x{:X}, 0x{:X}, 0x{:X}]'.format(*offs))
    offs = [syms['Randomizer_Starter{}TextOffset'.format(starter)] + 1
            for starter in STARTERS]
    setconfig('StarterTextOffsets',
              '[0x{:X}, 0x{:X}, 0x{:X}]'.format(*offs))

    setconfig('CanChangeStarterText', '1')
    setconfig('CanChangeTrainerText', '1')

    setconfig('TrainerClassAmount', '0x43')
    set_symbol('TrainerDataTableOffset', 'TrainerGroups')
    setconfig('TrainerDataClassCounts',
              '[1, 1, 1, 1, 1, 1, 1, 1, 15, 0, 1, 3, 1, 1, 1, 1, 1, 1, 1, 5, '
              '1, 14, 24, 19, 17, 1, 20, 21, 17, 15, 31, 5, 2, 3, 1, 19, '
              '25, 21, 19, 13, 14, 6, 2, 22, 9, 1, 3, 8, 6, 9, 4, 12, 26, '
              '22, 2, 12, 7, 3, 14, 6, 10, 6, 1, 1, 2, 5, 1]')
    set_symbol('TMMovesOffset', 'TMHMMoves')
    set_symbol('TrainerClassNamesOffset', 'TrainerClassNames')

    args.rom.seek(0x3bfff)
    while fpeek(args.rom) == b'\x00':
        args.rom.seek(-1, os.SEEK_CUR)
    tnamesize = 2691 + 0x3bfff - args.rom.tell()
    setconfig('MaxSumOfTrainerNameLengths', str(tnamesize))
    setconfig('DoublesTrainerClasses', '[60]')  # only twins

    set_symbol('IntroSpriteOffset', 'Randomizer_IntroSpriteOffset', 1)
    set_symbol('IntroCryOffset', 'Randomizer_IntroCryOffset', 1)
    set_symbol('MapHeaders', 'MapGroupPointers')
    set_symbol('LandmarkTableOffset', 'Landmarks')
    setconfig('LandmarkCount', '96')
    set_symbol('TradeTableOffset', 'NPCTrades')
    setconfig('TradeTableSize', '7')
    setconfig('TradeNameLength', '11')
    setconfig('TradeOTLength', '11')
    setconfig('TradesUnused', '[]')
    setconfig('TextDelayFunctionOffset', '0')

    key = 'Randomizer_CatchingTutorialMonOffset{:d}'
    offs = [syms[key.format(i)] + 1 for i in range(1, 4)]
    setconfig('CatchingTutorialOffsets',
              '[0x{:X}, 0x{:X}, 0x{:X}]'.format(*offs))

    set_symbol('PicPointers', 'PicPointers')
    set_symbol('PokemonPalettes', 'PokemonPalettes')

    offs = [syms['MoveTutorMove_{}'.format(move)] for move in TUTORS]
    setconfig('MoveTutorMoves', '[0x{:X}, 0x{:X}, 0x{:X}]'.format(*offs))

    set_symbol('MoveTutorMenuOffset', 'Randomizer_MoveTutorMenuOffset')
    set_symbol('MoveTutorMenuNewSpace', 'Randomizer_MoveTutorMenuNewSpace')
    set_symbol('CheckValueOffset', 'CheckValue')

    setconfig('StaticPokemonSupport', '1')
    setconfig('GameCornerPokemonNameLength', '11')

    for poke in STATIC_POKES:
        offs = [value + 1 for key, value in syms.items()
                if key.startswith('Randomizer_{}'.format(poke))]
        if len(offs) == 1:
            setconfig('StaticPokemon[]', '0x{:X}'.format(offs[0]))
        else:
            setconfig('StaticPokemon[]',
                      '[{}]'.format(', '.join(map('0x{:X}'.format, offs))))
    
    set_symbol('StaticPokemonOddEggOffset', 'Randomizer_OddEgg1')
    oddeggsize = syms['Randomizer_OddEgg2'] - syms['Randomizer_OddEgg1']
    setconfig('StaticPokemonOddEggDataSize', '0x{:X}'.format(oddeggsize))

    for poke in GAME_CORNER:
        offs = [syms['Randomizer_GameCorner{}Species1'.format(poke)] + 1,
                syms['Randomizer_GameCorner{}Species2'.format(poke)] + 1,
                syms['Randomizer_GameCorner{}Species3'.format(poke)] + 1,
                syms['Randomizer_GameCorner{}Name'.format(poke)]]
        setconfig('StaticPokemonGameCorner[]',
                  '[0x{:X}, 0x{:X}, 0x{:X}, 0x{:X}]'.format(*offs))

    set_tm_text(1, 'UnknownText_0x9d8da',
                'That is\\n%m.\\e')
    set_tm_text(3, 'UnknownText_0x71db3',
                'TM03 is\\n%m.\\p'
                'It\'s a terrifying\\n'
                'move!\\e')
    set_tm_text(5, 'Text_RoarOutro',
                'WROOOAR!\\nIT\'S %m!\\e')
    set_tm_text(6, 'UnknownText_0x196002',
                'JANINE: You\'re so\\n'
                'tough! I have a \\l'
                'special gift!\\p'
                'It\'s %m!\\e')
    set_tm_text(7, 'UnknownText_0x1893f4',
                'MANAGER: TM07 is\\n'
                'my %m.\\p'
                'It\'s a powerful\\n'
                'technique!\\e')
    set_tm_text(8, 'UnknownText_0x19452c',
                'That happens to be\\n'
                '%m.\\p'
                'If any rocks are\\n'
                'in your way, find\\l'
                'ROCK SMASH!\\e')
    set_tm_text(10, 'HiddenPowerGuyText2',
                'Do you see it? It\\n'
                'is %m!\\e')
    set_tm_text(11, 'UnknownText_0x5e821',
                'It\'s %m.\\n'
                'Use it wisely.\\e')
    set_tm_text(12, 'UnknownText_0x62df6',
                'It\'s %m.\\p'
                'Use it on\\n'
                'enemy [POKé]MON.\\e')
    set_tm_text(13, 'UnknownText_0x9d1c7',
                'That there\'s\\n'
                '%m.\\p'
                'It\'s a rare move.\\e')
    set_tm_text(16, 'UnknownText_0x199def',
                'That TM contains\\n'
                '%m.\\p'
                'It demonstrates\\n'
                'the harshness of\\l'
                'winter.\\e')
    set_tm_text(19, 'UnknownText_0x72cb0',
                'That was a\\n'
                'delightful match.\\p'
                'I felt inspired.\\n'
                'Please, I wish you\\l'
                'to have this TM.\\p'
                'It\'s %m.\\p'
                'It is a wonderful\\n'
                'move!\\p'
                'Please use it if\\n'
                'it pleases you…\\e')
    set_tm_text(23, 'UnknownText_0x9c3a5',
                '…That teaches\\n'
                '%m.\\e')
    set_tm_text(24, 'ClairText_DescribeDragonbreathDragonDen',
                'That contains\\n'
                '%m.\\p'
                'If you don\'t want\\n'
                'it, you don\'t have\\l'
                'to take it.\\e')
    set_tm_text(24, 'BlackthornGymClairText_DescribeTM24',
                'That contains\\n'
                '%m.\\p'
                'If you don\'t want\\n'
                'it, you don\'t have\\l'
                'to take it.\\e')
    set_tm_text(29, 'MrPsychicText2',
                'TM29 is\\n'
                '%m.\\p'
                'It may be\\n'
                'useful.\\e')
    set_tm_text(30, 'UnknownText_0x9a0ec',
                'It\'s %m.\\p'
                'Use it if it\\n'
                'appeals to you.\\e')
    set_tm_text(31, 'UnknownText_0x68648',
                'By using a TM, a\\n'
                '[POKé]MON will\\p'
                'instantly learn a\\n'
                'new move.\\p'
                'Think before you\\n'
                'act--a TM can be\\l'
                'used only once.\\p'
                'TM31 contains\\n%m.\\e')
    set_tm_text(37, 'SandstormHouseSandstormDescription',
                'TM37 happens to be\\n'
                '%m.\\p'
                'It\'s for advanced\\n'
                'trainers only.\\p'
                'Use it if you\\n'
                'dare. Good luck!\\e')
    set_tm_text(42, 'UnknownText_0x1a9d86',
                'TM42 contains\\n'
                '%m…\\p'
                '…Zzz…\\e')
    set_tm_text(45, 'UnknownText_0x54302',
                'It\'s %m!\\p'
                'Isn\'t it just per-\\n'
                'fect for a cutie\\l'
                'like me?\\e')
    set_tm_text(49, 'BugsyText_FuryCutterSpeech',
                'TM49 contains\\n'
                '%m.\\p'
                'Isn\'t it great?\\n'
                'I discovered it!\\e')
    set_tm_text(50, 'Text_Route31DescribeNightmare',
                'TM50 is\\n'
                '%m.\\p'
                'Ooooh…\\n'
                'It\'s scary…\\p'
                'I don\'t want to\\n'
                'have bad dreams.\\e')


if __name__ == '__main__':
    main()
