# Barney's Hide & Seek Video Autosplitter

This is an autosplitter for Barney's Hide & Seek, which I wrote for running the
[Any% No Controller](https://www.speedrun.com/barneys_hide_and_seek_game#Any_No_Controller) category.
It might work for other categories.

Being that this is a video autosplitter, it might be touchy when using not-my-capture-setup. For posterity,
I have tested this with a Sega Genesis Model 1 connected via composite to an Extron DVS-304 (upscaling to 720p VGA)
then to a Datapath VisionRGB-E1S for capture.

## How to use

### Requirements
- [LiveSplit 1.8.11 or later](http://livesplit.org/).
- [LiveSplit.VideoAutoSplit 0.5.2.3 or later](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/).
- A DirectShow output which has the game capture.
  - For OBS 25 and earlier, this can be done using [VirtualCam](https://obsproject.com/forum/resources/obs-virtualcam.949/).
    - Set this up using as a Source Filter option on the game capture.
    - You will need to "Start" this filter every time you open OBS.
  - (OBS 26 supposedly has a VirtualCam plugin built in-- I have not tried it)
  - I have also not used XSplit or Streamlabs OBS

### Installation
1. Install LiveSplit and LiveSplit.VideoAutoSplit as directed.
1. Download the [latest version](https://github.com/bstreiff/barney-autosplitter/releases) of this autosplitter.
1. In LiveSplit's layout editor, add a `Video Auto Splitter` component and configure it.
  - For `Game Profile`, use the `Barney.vas` file.
  - For `Capture Device`, select the virtual camera.
  - Configure the `Scan Region` to the width and height of the virtual camera.

### Usage
1. Create a splits file with four splits, one for each level:
  - Forest Friends
  - Music Town
  - Deep Blue Sea
  - Farm Fun
1. Run the game. Splits will happen at the following points:
  - Start: After Barney fully scrolls to the left in "Forest Friends".
  - "Forest Friends": at the "blue dinosaurs" transition screen
  - "Music Town": at the "pink dinosaurs" transition screen
  - "Deep Blue Sea": at the "purple dinosaurs" transition screen
  - "Farm Fun": when Barney waves at the conclusion of the level
  - The timer will automatically reset whenever the "SEGA" logo is detected.

### Troubleshooting
- The VideoAutoSplit plugin is still very rough. If things seem to just stop working, try restarting LiveSplit.
- The VideoAutoSplit plugin is also very CPU intensive and gets very unhappy if it starts falling behind in processing video; I've found that using Task Manager to elevate `LiveSplit.exe` to `Above Normal` priority helps.
