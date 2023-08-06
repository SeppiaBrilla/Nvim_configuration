mkdir ~/.config/nvim

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
mkdir ~/.config/nvim/lua/user
mv ./*  ~/.config/nvim/lua/user/
echo "Done"
