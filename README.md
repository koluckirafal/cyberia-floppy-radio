# Cyberia Floppy Radio
Scripts for a small internet radio filled with 90's/00's electronic music made on Amiga and other pre-Wintel systems.

## Usage
```
$ mkdir music
$ cd music
$ # copy your modules playable by xmp
$ cd ..
$ STREAM_PASSWORD=`pwgen -Bs1 12` docker-compose up
```

# TODO
- Reporting currently played song to IRC bot
