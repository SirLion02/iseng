# add fastest mirror
echo "fastestmirror=1" | sudo tee -a /etc/dnf/dnf.conf
sudo dnf update --refresh -y

# add rpmfusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update --refresh -y

# install i3-gaps
sudo dnf install --allowerasing i3-gaps

# install additional package
sudo dnf install thunar htop neofetch neovim light picom lxappearance alacrity polybar nitrogen flameshot ffmpeg-libs rofi

#cd dotfiles/
cp -rv i3/ alacritty/ polybar/ .config/

# Font for polybar
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip

mkdir Nerd\ Fonts
unzip FiraCode.zip -d Nerd\ Fonts
unzip Hack.zip -d Nerd\ Fonts

sudo mv Nerd\ Fonts /usr/share/fonts

rm FiraCode.zip
rm Hack.zip

# font for alacritty
wget https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip
unzip 0cef8205-ubuntu-font-family-0.83.zip

sudo mv 0cef8205-ubuntu-font-family-0.83/ /usr/share/fonts

rm 0cef8205-ubuntu-font-family-0.83.zip

# wallpaper
sudo cp wallpaper.jpeg /usr/share/backgrounds

# install brave browser
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser
