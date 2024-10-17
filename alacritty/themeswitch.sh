#!/bin/sh

dir="/home/ada/.config/alacritty/"

if cmp -s $dir/onehalflight.toml $dir/theme.toml; then
    cp $dir/onehalfdark.toml $dir/theme.toml
else
    cp $dir/onehalflight.toml $dir/theme.toml
fi

touch $dir/alacritty.toml
