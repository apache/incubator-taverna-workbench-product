#!/bin/bash
set -e
SRC=$1
DIR=/tmp/$$
VERSION=$(basename $SRC | sed 's/^openjdk-//' | sed 's/-unofficial-.*/-unofficial/')
echo "Version $VERSION"
INSTALL=$HOME/.install4j5/jres/

rm -rf $DIR
mkdir $DIR
echo "Unzipping $SRC to $DIR"
unzip $SRC -d $DIR >/dev/null
TARGZ=$(echo $SRC | sed s/.zip$//).tar.gz
TMPTARGZ=$DIR/openjdk.tar.gz

echo "Creating $TARGZ"
if test -z $(basename $SRC | sed s/.*image.zip$//) ; then 
    pushd $DIR/*/jre
        tar czf $TMPTARGZ *
    popd
    #echo "Creating bundle"
    #createbundle $DIR/*/jre/ --version="$VERSION"
else if test -z $(basename $SRC | sed s/.*bundle.zip$//); then
        pushd $DIR/*/*/Contents/..
            tar czf $TMPTARGZ *
        popd
    else
        echo "Unsupported filename, must be *.bundle.zip or *.image.zip"
        echo $SRC
        exit
    fi
fi
mv $TMPTARGZ $TARGZ

if test -d $INSTALL; then
    cp $TARGZ $INSTALL
    echo Installed $TARGZ to $INSTALL
else
    echo "Could not install to non-existing $INSTALL"
fi

echo "Deleting $DIR"
rm -rf $DIR
