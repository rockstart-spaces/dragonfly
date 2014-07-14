for movie in /home/pi/movies/* ; do
  echo $movie
  /home/pi/dist-file.sh $movie next.mp4
  dsh -Ma -c mv -v next.mp4 current.mp4
done