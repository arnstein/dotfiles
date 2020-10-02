USER=arnstein

apt install i3 zsh wget git cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 dconf-cli libxkbcommon-x11-dev libxcbcommon-dev libxcb-xinerama0-dev libev-dev fonts-powerline

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

chsh -s /usr/bin/zsh $USER

git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh


# i3lock 2.12 required
git clone https://github.com/yvbbrjdr/i3lock-fancy-rapid
cd i3lock-fancy-rapid
make
mv i3lock-fancy-rapid /usr/bin/

git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh
