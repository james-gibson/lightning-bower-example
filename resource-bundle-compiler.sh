TARGET=src/staticresources
#Clean Static resources folder up
rm -rf $TARGET/
mkdir $TARGET

for path in resource-bundles/*;
do
    if [ -d "${path}" ]
    then #Zip folders into .resource files
        dirname="$(basename "${path}")"
        cd $path
        zip -r --exclude=*.scss ../../$TARGET/$dirname .
        cd ../../
    else
        filename="${path##*/}"
        cp resource-bundles/$filename $TARGET
    fi
done

cd $TARGET
rename -v 's/\.css$/\.resource/' *.css
rename -v 's/\.js$/\.resource/' *.js
rename -v 's/\.jpg$/\.resource/' *.jpg
rename -v 's/\.csv$/\.resource/' *.csv
