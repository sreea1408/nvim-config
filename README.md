# nvim config

## Getting Started

```
cd ~/.config
git clone https://github.com/sreea1408/nvim-config nvim
cd nvim
chmod u+x install.sh
./install.sh
nvim
```

## Formatting

Install stylua via mason and then run the following command:
```
~/.local/share/nvim/mason/bin/stylua -v --call-parentheses None --collapse-simple-statement Always --column-width 80 --indent-type Spaces --quote-style AutoPreferSingle .
```

