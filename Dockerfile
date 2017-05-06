# VERSION:        0.1
# DESCRIPTION:    Build the Electron App in the container
# AUTHOR:         Anthony Gillespie <anthonycgillespie@gmail.com>
# COMMENTS:
#   Based off Dockerfiles by Jessica Frazelle <jessie@docker.com>
#  		https://blog.jessfraz.com/post/docker-containers-on-the-desktop/ and
#		https://gist.github.com/paulcbetts/c3bb783cf45a13fd1e6e
# USAGE:
#   # Build image
#   docker build -t finesse .
#
#   # Run the image
#   docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY finesse
#
#	# If you get the error "no protocol specified" then try the following:
#   xhost local:root
#	# Then run the image again

#Download base image ubuntu 16.04
FROM ubuntu:16.04

# Update Ubuntu Software repository
RUN apt-get update

# Install nodejs, npm, git, libgtk2.0-dev and libx11-xcb-dev
RUN apt-get install -y nodejs-legacy npm git 

# Install X11 server stuff
RUN apt-get install -y libgnome-keyring-dev libnss3 libgtk2.0-dev libnotify-dev libdbus-1-dev libxrandr-dev libxext-dev libxss-dev libgconf2-dev libasound2-dev libcap-dev libcups2-dev libxtst-dev

# Pull the repo
RUN git clone https://github.com/anthonygillespie/finesse.git

# Install dependencies
WORKDIR /finesse
RUN npm install

WORKDIR /finesse
CMD ["npm","start"]