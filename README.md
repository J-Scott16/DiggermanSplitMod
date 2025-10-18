# Diggerman Speedrun Tools

This repository contains tools for speedrunning **Diggerman**, including a LiveSplit auto-splitter and a BepInEx mod for outputting the in-game score.

## Contents

- `DiggermanSplitMod.dll` – The BepInEx mod that writes the score to memory.  
- `DiggermanSplitMod.cs` – Source code for the mod.  
- `DiggermanSplitMod.csproj` – Project file for building the mod.  
- `Diggerman_AutoSplitter.asl` – Auto Splitter script for LiveSplit.  
- `Diggerman_Splits.lss` –  Live Split splits   
- `Diggerman_Layout.lsl` – Live Split layout

## Installation

### Mod (BepInEx)

1. Install [BepInEx](https://docs.bepinex.dev/) for your platform.(make sure you install bepinex x86)
2. Add everything from the bepinex folder into the Diggerman folder with diggerman.exe
3. Run the game once to load bepinex
4. Copy `DiggermanSplitMod.dll` into `BepInEx/plugins/`.  
5. Run Diggerman. The mod will output scores so the autosplitter can detect them.

### LiveSplit Auto Splitter

1. Open LiveSplit.  (https://livesplit.org/)
2. Add a **Scriptable Auto Splitter** and select `Diggerman.asl`.  
3. Open the Diggerman_Splits.lss as the split
4. Open the Diggerman_Layout.lsl as the layout for LiveSplit

## Usage

- The timer will start automatically when the game starts.  
- Splits will happen automatically, except that at the end, you will have to manually end the run.  
- Resetting the timer also resets split tracking.

## Development

- Build the mod from the `.csproj` using Visual Studio.  
- Modify the `.asl` file for custom split logic.  
- Contributions welcome!

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
