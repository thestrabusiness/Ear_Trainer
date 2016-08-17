# Ear Trainer

A simple app that tests your ability to recognize tones and differentiate between lossy and lossless audio files.

## Requirements
Currently this program will **only run on Windows**. You'll need the Win32-Sound gem using `gem install win32-sound` .

## Running the app
Starting the app by running main.rb. Enter your name and you'll be present with the following options:

1. Tone training
..* Selecting this option will present you with a list of 10 tones across all octaves of human hearing. Enter the number corresponding to the tone you want to hear.
2. Lossy vs. lossless training
..* This option will present you with a list of pairs of music samples, one lossless, the other lossy. Enter the corresponding number to hear and compare the samples.
3. Tone test
..* The tone test preesents you with 10 randomly generated questions. Each question will play a tone, then ask you to pick which frequency is corresponds to from a list of 4 possible answers.
4. Lossy vs lossless test
..* Here you'll hear the pairs of song samples played side by side, and then asked to choose with was the lossless sample.
5. Exit

