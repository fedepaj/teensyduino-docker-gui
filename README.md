# Teensyduino docker arduino ide
The aim of this project is to make teensyduino self contained on linux since I hate to repeat the procedure every time I change OS or machine.

## Objective
Make an executable with pyinstaller that can be installed and when called starts a docker conntainer containing Arduino IDE configured for Teensy boards tunnelling the UI though X.
The script takes care of connecting the container to the X server via `xauth`.

## Distribution 
I am planning to automate the distribution process via CI/CD stuff.

## TO-DO
- [ ] .desktop entry
- [ ] an icon 
