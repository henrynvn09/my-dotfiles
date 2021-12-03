# My dotfiles
**YOU'D BETTER LOOK AT THE RAW VERSION OF README**

![Dec-2-2021-23-07](screenshots/image.png)

## remove dual boot

<https://www.youtube.com/watch?v=7GRUsnVNLNg>

## archlinux

### installation

### initial
swapfile 8 gb

### Grub

if Windows entry doesn't show up:
Get UUID `sudo blkid /dev/nvme0n1p5`
then add
    ```/etc/grub.d/40_custom 
    menuentry 'Windows 10' {
        insmod ntfs
        search --no-floppy --fs-uuid --set=*enter UUID*
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }
    ```

## packages
| manjaro | freeoffice                                                                                                                                                                                                                                                           | office suite                                                                                           |
| manjaro | vlc                                                                                                                                                                                                                                                                  | video player <https://www.deviantart.com/maverick07x/art/VLC-MinimalX-385698882>                       |
| manjaro | GIMP                                                                                                                                                                                                                                                                 | image editor                                                                                           |
| pacman  | git                                                                                                                                                                                                                                                                  |                                                                                                        |
| github  | yay                                                                                                                                                                                                                                                                  | AUR packages manager                                                                                   |
| github  | checkupdates-aur                                                                                                                                                                                                                                                     | check updates for polybar                                                                              |
| yay     | yadm                                                                                                                                                                                                                                                                 | dotfiles manager                                                                                       |
| yay     | chromium                                                                                                                                                                                                                                                             | sync with dan account                                                                                  |
| pacman  | firefox                                                                                                                                                                                                                                                              | sync with dan account                                                                                  |
|         |                                                                                                                                                                                                                                                                      | fix video play https://support.mozilla.org/en-US/kb/upgrade-graphics-drivers-use-hardware-acceleration |
| yay     | ttf-font-awesome ttf-material-design-icons ttf-fira-go ttf-weather-icons nerd-fonts-fira-code nerd-fonts-dejavu-complete ttf-dejavu-sans-mono-powerline-git ttf-devicons awesome-terminal-fonts-git ttf-material-design-icons-git ttf-joypixels ttf-icomoon-feather | font-awesome icon                                                                                      |
| github  | https://github.com/klokantech/klokantech-gl-fonts/releases/tag/v1.0.0                                                                                                                                                                                                |                                                                                                        |
| pacman  | fzf                                                                                                                                                                                                                                                                  | command-line fuzzy finder                                                                              |
| pacman  | dunst                                                                                                                                                                                                                                                                | lightweight replacement for the notification-daemons                                                   |
| yay     | ibus-bamboo                                                                                                                                                                                                                                                          | vietnamese keyboard systemctl enable ibus                                                              |
# remember to set ibus-engine
| yay    | redshift-minimal                                                | adjusts the color temperature                         |
| pacman | anki                                                            | learn everything                                      |
| pacman | okular zathura zathura-pdf-poppler                              | pdf reader                                            |
| pacman | ripgrep                                                         | line-oriented search tool                             |
| pacman | ctags                                                           | generate tag file                                     |
| yay    | todotxt                                                         |                                                       |
| pacman | syncthing                                                       | sync files direct cross devices                       |
| pacman | texlive-core texlive-science texlive-pictures texlive-langextra | most needed TeX Live packages (latex)                 |
| yay    | tllocalmgr-git                                                  | manage Texlive packages (install...)                  |
| yay    | zotero                                                          | reference management software to manage bibliographic |
| pip    | sympy                                                           | A computer algebra system written in pure Python      |
| github | apy                                                             | convert md to anki                                    |
| yay    | visual-studio-code-bin                                          | vs-code MS version                                    |
| yay    | obsidian                                                        | temporary note taking, it has graph mind map          |
| pacman | keepassxc                                                       | password manager                                      |
| yay    | notion-app-enhanced                                             |                                                       |

### graphic
|pacman| nvidia|remember to select version follow kernels|
|yay | optimus-manager optimus-manager-qt| hybrid CPU GPU|
#sudo mhwd -i pci video-nvidia
### gtk3

| pacman | pcmanfm                          | file manager UI                                        |

### i3-gaps
| pacman | i3                                           |                                                         |
| pacman | pacman                                       |                                                         |
| pacman | rofi  1.6.1-1                                | window switcher, run dialog, ssh-launcher               |
| github | git@github.com:ClydeDroid/rofi-bluetooth.git |                                                         |
| pacman | feh                                          | set wallpaper                                           |
| yay    | autotiling                                   | i3 auto tilling                                         |
| yay    | wmfocus                                      | giong vim-sneak                                         |
| yay    | maim xclip                                   | crop screen & copy to clipboard                         |
| yay    | i3-resurrect                                 | saving and restoring i3 workspaces                      |
| pacman | pulseaudio                                   | to make audio control work, remember pulseaudio --start |
|        |                                              | systemctl --user enable pulseaudio                      |
| pacman | brightnessctl                                | brightness control                                      |

### polybar

| yay    | polybar        | status bar                                           |
| pip    | simpleaudio    |                                                      |
| pacman | pacman-contrib | contains contributed scripts to pacman. help polybar |
| yay    | zscroll-git    | text scroller for panels terminals                   |
| pacman | jq             | Command-line JSON processor support weather          |

### utilities

| pacman | xorg-xinput                | configure input devices                        |
| yay    | betterlockscreen           | beautiful lock screen for linux                |
|        |                            | betterlockscreen --update abc.png neu thay anh |
| yay    | bdfresize                  | resize bdf font cua polybar                    |
| yay    | rofi-greenclip             | rofi clipboard manager                         |
|        |                            | systemctl --user enable greenclip.service      |
| pacman | plasma-browser-integration | help playerctl in firefox                      |
| pacman | tldr                       | community man page                             |
| yay    | tlauncher obsidian         |                                                |

### terminal

| yay    | rxvt-unicode-truecolor urxvt-resize-font-git | true color                      |
| pacman | zsh                                          |                                 |
| pacman | tree                                         | show folder tree                |
| pacman | ranger                                       | file manager text-based         |
| pacman | bat                                          | cat with code highlight         |
| pacman | python-pillow                                | support image preview in ranger |
| pacman | thefuck                                      | terminal correction             |

### others useful plugins

| yay | i3keys                     | Lists available bindings for i3 with a graphical or text keyboard       |
| yay | i3session                  | remembers what's running in your i3 workspaces by saving a session file |
| yay | i3-layout-manager-git      | Saving, loading and managing layouts for i3wm                           |
| git | meelkor/polybar-i3-windows | show i3 running application in polybar                                  |
| git | KDE/kdeconnect-kde         | multi-platform app that allows your devices to communicate              |
|     |                            | systemctl --user enable greenclip                                       |

### python

| pacman | systemd-homed           | support psd                               |
| pip    | playsound               | support sound notifi for polybar pomodoro |
| pip    | selenium beautifulsoup4 | crawl html python                         |
| pip    | simpleaudio             | playaudio files                           |

## neovim
| pip3   | neovim     | support neovim                 |
| npm    | write-good | Naive linter for English prose |
| pacman | proselint  | A linter for prose.            |
| pip3   | yq         | taking notes                   |

## Inititial

## Things to remove
disable kwallet in settings
remove thunderbird

### update location
polybar weather, redshift

### syncthing
add devices using $syncthing
systemctl --user enable syncthing

## 1st thing after install

<https://youtu.be/jW4GFGOIUjc>

## Anki
- Plugins:
    - AwesomeTTS 1436550454 [link](https://languagetools.anki.study/tutorials/awesometts-getting-started?utm_campaign=addonpage_awesometts&utm_source=ankiweb&utm_medium=web)
        - need `pacman -S mpv`
    - ReviewHeatmap 723520343
    - Image Occlusion Enhanced 1374772155
    - ankiconnect 2055492159
    - Pop-up dictionary Beta 153625306
    - Redesign
    - Accelerate Image Drag And Drop
    - Symbols
- md to anki
    - [obsidian to anki](https://github.com/Pseudonium/Obsidian_to_Anki)
        - need `pip install gooey`
        - `python ~/Obsidian_to_Anki-3.4.1/obsidian_to_anki.py -R ~/Documents/notes/College/Fall-2021/Vocabulary -r`
## Printer and scanner

- install:
  * cups for printing
  * simple-scan for scanner
- Hp printer:
  * install hplip to support hp library for cups
  * run hp-plugin -i for scanning; if not work, try hp-setup -i
$ addFirewallRule 5353
$ addFirewallRule 53
$ addFirewallRule 631

## zsh shell
`chsh -s /bin/zsh`
### install oh-my-zsh

`ZSH="$HOME/.config/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

#### Necessary packages

| pacman | pkgfile                 | pkgfile -u; need for command-not-found    |

### additional plugin not included in oh-my-zsh

| zsh-autosuggestions     | `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`             |
| zsh-syntax-highlighting | `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` |
| zsh-autopair            | `git clone https://github.com/hlissner/zsh-autopair.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair`             |
| zsh-completions         | `git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions`                     |
| vivid                   | generate ls_colors                                                                                                                      |

## nvim

## latex
sudo pacman -S texlive-core texlive-science texlive-pictures texlive-langextra

yay tllocalmgr-git // manage Texlive packages

tllocalmgr install apa6

## Chrome

cycle through last used tab [link](https://superuser.com/questions/104917/chrome-tab-ordering/1326712#1326712)

- adblock: ublock, nano defender, [FMSF-2](https://nmtrung.com/fmsf-2/)

firefox support video download extension: yay -S vdhcoapp

## Turn on bluetooth on startup (before X)
enable system update bluez
bluetoothctl trust <id>
vi /etc/bluetooth/main.conf
AutoEnable=true

## Wine
run windows packages; remember to enable pacman multilib. [Source](https://www.youtube.com/watch?v=ibge7-4sitQ)

sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
```
mhwd
sudo mhwd -a pci nonfree 0302
-> [step 3.1](https://archived.forum.manjaro.org/t/howto-set-up-prime-output-offload-with-nvidia-proprietary-driver/40225)
```

sudo pacman -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader

## commands

- fontconfig để install font `fc-cache -v`
- update packages Pacman -Syu
- remove unnecessary Pacman -Qn / -Qdt dont need
- remove completely Pacman -Rns package

- error import pgp on yay install:  gpg --keyserver pool.sks-keyservers.net --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
