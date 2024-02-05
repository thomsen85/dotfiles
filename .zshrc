# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Brew
export HOMEBREW_BREWFILE=~/.brewfile

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export EDITOR='nvim'
ZSH_THEME="powerlevel10k/powerlevel10k"

# export CPATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/
# Plugins
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias zshconfig="vim ~/.zshrc"
alias ti="tmuxinator"
alias vimconfig="vim ~/.vimrc"
alias v="nvim ."
alias nv="nvim"
alias obsidian="cd ${HOME}/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents"
alias chad="imgcat ~/giga.jpg"
alias docx2pdf="/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf"

# Own functions
mcd ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

cppcr() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: cppcr <filename.cpp>"
        return 1
    fi

    local filename="$1"
    local output_file="${filename%.*}"

    if clang++ -std=c++20 -Wall -Wextra -o "$output_file" "$filename"; then
        echo "Compilation successful. Running $output_file..."
        "./$output_file"
    else
        echo "Compilation failed."
    fi
    rm "$output_file"
}

function duls {
    paste <( du -hs -- "$@" | cut -f1 ) <( ls -ldf -- "$@" )
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# For auto complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/thomassvendal/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/thomassvendal/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/thomassvendal/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/thomassvendal/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

# pnpm
export PNPM_HOME="/Users/thomassvendal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
