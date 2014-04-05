# Dragonfly

## The rockstart official videowall

Nothing to see here for the moment.
Go get caught by the dragonfly gaze.

### The Architect

`10.10.221.100`

### The Executors
Pi #1
`10.10.221.101`

Pi #2
`10.10.221.102`

Pi #3
`10.10.221.103`

Pi #4
`10.10.221.104`

Pi #5
`10.10.221.105`

Pi #6
`10.10.221.106`

Pi #7
`10.10.221.107`

Pi #8
`10.10.221.108`

Pi #9
`10.10.221.109`

Pi #0
`10.10.221.110`

Pi #1
`10.10.221.111`

Pi #2
`10.10.221.112`

### Commands 

#### Client

pwomxplayer --tile-code=bez_41 udp://239.0.1.23:1234?buffer_size=1200000B 

#### Server

avconv -re -i movie.mp4 -vcodec copy -f avi -an udp://239.0.1.23:1234


# TODO: clean up

# install piwall on raspberry
wget http://dl.piwall.co.uk/pwlibs1_1.1_armhf.deb
dpkg -i /home/pi/pwlibs1_1.1_armhf.deb
wget http://dl.piwall.co.uk/pwomxplayer_20130815_armhf.deb
sudo dpkg -i /home/pi/pwomxplayer_20130815_armhf.deb

# configure dedicated subnet
sudo route add -net 224.0.0.0 netmask 240.0.0.0 eth0

# command server
avconv -re -i WappZapp\ -\ TV\ for\ the\ on-demand\ generation-82570068.mp4 -vcodec copy -f avi -an udp://239.0.1.23:1234

# command client
pwomxplayer --tile-code=bez_41 udp://239.0.1.23:1234?buffer_size=1200000B 
