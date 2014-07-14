for movie in /home/pi/movies/* ; do
  echo $movie
  /home/pi/stream.sh $movie
done