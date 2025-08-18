function fish_greeting
end

### ALIASES ###
# C++
alias cpp="clang++ -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion"

# neovim
alias vim="nvim"
alias vi="nvim"

# launch starship
starship init fish | source

# launch zoxide
zoxide init fish | source
