# add fastest mirror
echo "fastestmirror=1" | sudo tee -a /etc/dnf/dnf.conf
sudo dnf update --refresh -y

# add rpmfusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update --refresh -y

# install i3-gaps
sudo dnf install --allowerasing i3-gaps -y

# install additional package
sudo dnf install thunar htop neofetch neovim light picom lxappearance alacritty polybar nitrogen flameshot ffmpeg-libs rofi -y

#cd dotfiles/
cp -v i3/ ~/.config/
cp -v alacritty/ ~/.config/
cp -v polybar/ ~/.config/
chmod +x ~/.config/polybar/polybar-launch.sh
chmod +x ~/.config/i3/volume-max-100.sh

# Font for polybar
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip

mkdir Nerd\ Fonts
unzip FiraCode.zip -d Nerd\ Fonts
unzip Hack.zip -d Nerd\ Fonts -A

sudo mv Nerd\ Fonts /usr/share/fonts

rm FiraCode.zip
rm Hack.zip

# font for alacritty
sudo mv ubuntu-font-family-0.83/ /usr/share/fonts

# wallpaper
sudo cp wallpaper.jpeg /usr/share/backgrounds

# install brave browser
sudo dnf install dnf-plugins-core -y

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser -y
