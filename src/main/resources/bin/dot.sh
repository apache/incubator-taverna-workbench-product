#!/bin/sh

## Script for calling bundled dot_static
## on multiple platforms, falling back to 
## "dot" on the path
## 
## Copyright 2013 University of Manchester
## 
## This file is licensed under LGPL 2.1
## See ../LICENSE.txt for details

dir=`dirname "$0"`

## Make sure these work on both Linux and OS X 
# Not tested: BSD/Solaris

# TODO: Test on 32-bit amd Linux
arch=`uname -m | sed s/i.86/i386/`
os=`uname -s`

#default fallback
dot="dot"

#echo "os $os"
#echo "arch $arch"
#echo ""

if [ "$os" = "Linux" ] ; then
    if [ "$arch" = "x86_64" ] ; then 
        dot="$dir/linux-x64/dot_static"
    fi
    if [ "$arch" = "x86" ] ; then 
        dot="$dir/linux-x86/dot_static"
    fi
fi
if [ "$os" = "Darwin" ] ; then
    # Note, uname may lie and say it is i686 instead of x64!
    dot="$dir/osx-x64/dot_static"
fi

if [ "$dot" != "dot" && ! -x "$dot" ] ; then  
    #echo "Could not find/execute $dot"
    dot="dot"
fi


#echo "Using $dot"
"$dot" $1+


