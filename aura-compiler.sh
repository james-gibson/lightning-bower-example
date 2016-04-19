TARGET=src/aura
#Clean Aura folder up
rm -rf $TARGET/
mkdir $TARGET

cp -r ./aura-components/ ./src/aura
mv ./aura-components/readme.warning ./src/aura/readme.md

