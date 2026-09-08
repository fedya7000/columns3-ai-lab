# Columns III — reverse engineering, mods and AI

Research and modding tools for **Columns III (USA)** on Sega Mega Drive / Genesis.

## Projects

- `mod/`: disassembly and research notes, score-based tournament rules, bug fixes, Sailor Moon-inspired graphics/music definitions, patch builders and investigation tools.
- `ai/`: rules model, 68000/VDP research emulator, self-play bot, training scripts, current model weights and experiments.

## Setup

Python 3.11 is recommended. Install `requirements.txt`. Put your own cartridge dump at `mod/rom/Columns III (USA).gen` and `ai/rom/Columns III (USA).gen`.

Expected ROM MD5: `441b7e9c9811e22458660eb73975569c`.

ROM binaries and generated modified ROMs are not included.

## Build a mod

Run from `mod/`:

```sh
python tools/patch.py "rom/Columns III (USA).gen" patches/turnir.py build/c3_turnir.gen
python tools/patch.py "rom/Columns III (USA).gen" patches/sailor.py build/c3_sailor.gen
```

The tournament winner must exceed the opponent's score. The patch also fixes matching near the top of the field and disables manual attacks in two-player mode. See `mod/docs/turnir.md` for the exact rules and checks.

## Run the bot

Run from `ai/`:

```sh
python tools/simulate.py 1 1
python tools/play_rom.py 200
python tools/efir.py 3
```

The simulator does not need a ROM. The emulator-backed tools require the cartridge dump. The viewer uses Tkinter; on some Linux distributions it is installed separately as `python3-tk`.

The bot reads the board from emulated RAM and evaluates possible placements. It is not a vision model. The research emulator has known limitations and does not emulate original console audio.

## Research notes

Start with `mod/docs/SOSTOYANIE.md` and `ai/docs/IGRA.md`. Most research notes are in Russian. The files document discoveries and the state of the project when they were written. Exploratory scripts under `build/` may need the specific inputs named in their source.

## По-русски

В репозитории два игровых проекта: разбор и модификации Columns III, а также AI-бот. Здесь находятся исследовательские заметки, дизассемблер, инструменты, рецепты патчей, графика и музыкальные определения мода, код обучения и текущие веса.

## Attribution

Columns III and its original code, graphics and music belong to their respective rights holders. Sailor Moon references belong to their respective rights holders. This is an independent fan/research project; no blanket license is asserted over the original game's disassembly or assets.
