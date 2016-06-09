# Dragonfly

The rockstart official videowall.

## Architecture

### The Architect

`10.10.221.100`

### The Executors

Pi #1: `10.10.221.101`

Pi #2: `10.10.221.102`

Pi #3: `10.10.221.103`

Pi #4: `10.10.221.104`

Pi #5: `10.10.221.105`

Pi #6: `10.10.221.106`

Pi #7: `10.10.221.107`

Pi #8: `10.10.221.108`

Pi #9: `10.10.221.109`

Pi #10: `10.10.221.110`

Pi #11: `10.10.221.111`

Pi #12: `10.10.221.112`

## Usage

Get into the executors and initialize the streaming

```bash
pwomxplayer --tile-code=bez_41 udp://239.0.1.23:1234?buffer_size=1200000B
```

Get into the architect and streams to every

```bash
avconv -re -i movie.mp4 -vcodec copy -f avi -an udp://239.0.1.23:1234
```

## Add an executor

### Install PiWall

```bash
wget http://dl.piwall.co.uk/pwlibs1_1.1_armhf.deb
dpkg -i /home/pi/pwlibs1_1.1_armhf.deb
wget http://dl.piwall.co.uk/pwomxplayer_20130815_armhf.deb
sudo dpkg -i /home/pi/pwomxplayer_20130815_armhf.deb
```

### Configure dedicated subnet
```
sudo route add -net 224.0.0.0 netmask 240.0.0.0 eth0
```

# Recode

avconv -i bbb_sunflower_1080p_30fps_normal.mp4 -vcodec mpeg4 -qscale 8 -r 30 -acodec copy bbb_sunflower_1080p_30fps_normal.avi


# Clone SD cards
Once you have a working SD card, it's easiest to clone the card to get more.

Run as root:

```bash
# make backup
dd if=/dev/mmcblk0 of=videowall.img
# for each card, do:
dd of=/dev/mmcblk0 if=videowall.img
# mount at /media/{USER}/{foo} (or just re-insert), then:
./scripts/set_number.py SCREEN_NUMBER
```

# Backend 

Once:
```bash
cd piwall
sudo pip install -r requirements.txt
python manage.py syncdb
python manage.py schemamigration api --initial
python manage.py migrate api
```

Starting test server:
```bash
python manage.py runserver
```

Browser-navigatable API at http://localhost:8000

Admin interface at http://localhost:8000/admin

Still much to do though.


# TODO

- frontend
- backend
- coupling scripts with backend
- everything
- 42
