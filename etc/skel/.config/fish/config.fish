if status is-interactive
    ### Commands to run in interactive sessions can go here
    
    ### Set terminal splash screen
    macchina -t ControlThings

    ### Set prompt (config at ~/.config/starship.toml)
    starship init fish | source

    ### Set path
    fish_add_path ~/bin
    fish_add_path ~/.local/bin
    fish_add_path ~/go/bin

    ### Set colors for man pages
    # setaf = forground, setab = background
    # 0=black 1=red 2=green 3=yellow 4=blue 5=purple 6=cyan 7=white
    set -x fish_greeting "Welcome to Fish!"
    set -x LESS_TERMCAP_mb $(tput bold; tput setaf 1)  # Start blink mode
    set -x LESS_TERMCAP_md $(tput bold; tput setaf 3)  # Start bold mode
    set -x LESS_TERMCAP_mr $(tput rev)                 # Start reverse mode
    set -x LESS_TERMCAP_mh $(tput dim)                 # Start dim mode
    set -x LESS_TERMCAP_so $(tput bold; tput setaf 1; tput setab 4)   # Start standout mode
    set -x LESS_TERMCAP_se $(tput rmso; tput sgr0)     # Stop standout mode
    set -x LESS_TERMCAP_us $(tput smul; tput bold; tput setaf 6)  # Start underline mode
    set -x LESS_TERMCAP_ue $(tput rmul; tput sgr0)     # Stop underline mode
    set -x LESS_TERMCAP_ZN $(tput ssubm)               # Start subscript mode
    set -x LESS_TERMCAP_ZV $(tput rsubm)               # Stop subscript mode
    set -x LESS_TERMCAP_ZO $(tput ssupm)               # Start superscript mode
    set -x LESS_TERMCAP_ZW $(tput rsupm)               # Stop subscript mode
    set -x LESS_TERMCAP_me $(tput sgr0)                # Stop all modes
    set -x GROFF_NO_SGR 1                                # Old drawing scheme

    ### Functions
    function paginate
        $argv | bat -l toml
    end

    ### Set environmental variables
    set -x EDITOR /usr/bin/vim
    set -x PAGER '/usr/bin/bat -p --pager "less -RFSM --shift 4 --use-color"'

    ### Aliases
    alias bat='bat -p --pager "less -RFSM --shift 4 --use-color --color Ny"'
    # alias dnf="dnf -C"
    alias c="clear"
    alias cm="clear && macchina -t ControlThings"
    alias edit="gnome-text-editor"

    ### Abbreviations
    # dnf
    # abbr -a ds  "paginate dnf -qC --showduplicates search"
    # abbr -a di  "paginate dnf -qC info"
    # abbr -a dl  "paginate dnf -qC list | grep"
    # abbr -a dli "paginate dnf -qC list installed | grep"
    # abbr -a dld "dnf -qC --showduplicates list '**'"
    # abbr -a sdi "sudo dnf install"
    # abbr -a sdu "sudo dnf update"
    # abbr -a sdr "sudo dnf remove"
    # abbr -a dh  "paginate dnf history"
    # abbr -a dhi "paginate dnf history info"
    # abbr -a dhu "paginate dnf -qC history userinstalled"
    # abbr -a drl "paginate dnf -qC repoquery -l"
    # abbr -a dp "dnf provides"
    # flatpak
    abbr -a f   "flatpak"
    abbr -a fe  "flatpak enter"
    abbr -a fh  "flatpak history"
    abbr -a fi  "flatpak info"
    abbr -a fI  "flatpak install"
    abbr -a fl  "flatpak list --columns size,application,description"
    abbr -a fla "flatpak list --app --columns size,application,version,runtime"
    abbr -a flr "flatpak list --runtime --columns size,application,branch,version"
    abbr -a fr  "flatpak run"
    abbr -a fs  "flatpak search"
    abbr -a fu  "flatpak uninstall"
    # podman
    abbr -a pil "podman image list"
    abbr -a pcl "podman container list"
    abbr -a pcs "podman container start"
    abbr -a pcS "podman container stop"
    abbr -a pr "podman run"
    # other
    abbr -a pg  "ps -Al | grep"
    
    ### Commands
    mkdir -p /tmp/$USER && ln -Tfs /tmp/$USER /home/$USER/tmp
    
end
