vi-prepend-x-selection () {
    PASTE=$(xclip -o -sel c </dev/null)
    LEN=${#PASTE}
    BUFFER=$LBUFFER$PASTE$RBUFFER;
    CURSOR=$CURSOR+LEN-1
}
zle -N vi-prepend-x-selection
bindkey -a 'P' vi-prepend-x-selection

vi-append-x-selection () {
    PASTE=$(xclip -o -sel c </dev/null)
    LEN=${#PASTE}
    BUFFER=${BUFFER:0:$CURSOR+1}$PASTE${BUFFER:$CURSOR+1};
    CURSOR=$CURSOR+LEN
}
zle -N vi-append-x-selection
bindkey -a 'p' vi-append-x-selection

zsh-y-x-selection () {
    zle vi-yank
    echo -n $CUTBUFFER | xclip -i -sel c;
}
zle -N zsh-y-x-selection
bindkey -a 'y' zsh-y-x-selection

zsh-Y-x-selection () {
    zle vi-yank-eol
    echo -n $CUTBUFFER | xclip -i -sel c;
}
zle -N zsh-Y-x-selection
bindkey -a 'Y' zsh-Y-x-selection
