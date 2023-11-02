ARG version=22.04
# version is passed through by Docker.
# shellcheck disable=SC2154
FROM ubuntu:"${version}"
ARG DEBIAN_FRONTEND=noninteractive

  
   useradd -m -s /bin/bash linuxbrew \
   echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers \
   su - linuxbrew -c 'mkdir ~/.linuxbrew'
     
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)" \
	
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>~/.profile\
	
echo 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >>~/.profile\
	
echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >>~/.profile\
	
source ~/.profile\

USER linuxbrew
COPY --chown=linuxbrew:linuxbrew . /home/linuxbrew/.linuxbrew/Homebrew
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
WORKDIR /home/linuxbrew

 mkdir -p \
  .linuxbrew/bin \
  .linuxbrew/etc \
  .linuxbrew/include \
  .linuxbrew/lib \
  .linuxbrew/opt \
  .linuxbrew/sbin \
  .linuxbrew/share \
  .linuxbrew/var/homebrew/linked \
  .linuxbrew/Cellar \
  	


