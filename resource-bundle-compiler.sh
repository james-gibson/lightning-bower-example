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
        zip -r ../../$TARGET/$dirname .
        cd ../../
    else
        filename="${path##*/}"
        cp resource-bundles/$filename $TARGET
    fi
done

