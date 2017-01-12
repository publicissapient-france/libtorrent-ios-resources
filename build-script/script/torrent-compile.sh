#! /bin/sh -e

## Compiles torrent for given host (i386, arm)
## Usage:
## $0 arch ios-sdk-minversion lib-path

ARCH=$1
SDKMIN=$2
SRCDIR=$3

HOST=$ARCH
SDKVERSION=$(xcrun -sdk iphoneos --show-sdk-version)
PLATFORM="iphoneos"

BOOST_DIR=$LIB_PATH/boost/prefix
OPENSSL_DIR=$LIB_PATH/openssl/bin
TMP_DIR=/tmp/.build.torrent

#===============================================================================
# Functions
#===============================================================================

function prepare_tmp {
  rm -rf $TMP_DIR
  mkdir -p $TMP_DIR/include
  cp -r /usr/include/net $TMP_DIR/include
}

function run_configure {
  ./configure \
  --with-boost-libdir=$LIB_PATH/boost \
  --with-openssl=$OPENSSL_ROOT \
  --enable-debug=no \
  --host=${HOST}-apple-darwin
}

if [[ $ARCH == "x86_64" || $ARCH == "i386" ]]; then
  HOST="i386"
  PLATFORM="iphonesimulator"
elif [[ $ARCH == "arm64" ]]; then
  HOST="arm"
  PLATFORM="iphoneos"
fi

PLATFORMPATH=$(xcrun --sdk $PLATFORM --show-sdk-path)

export OPENSSL_ROOT=$OPENSSL_DIR/$PLATFORM$SDKVERSION-$ARCH.sdk
export OPENSSL_LDFLAGS=$OPENSSL_ROOT/lib

export BOOST_ROOT=$BOOST_DIR
export BOOST_LDFLAGS=$BOOST_ROOT/lib

export CC=$(xcrun -sdk iphoneos -find clang)
export CPP="$CC -E"
export AR=$(xcrun -sdk iphoneos -find ar)
export RANLIB=$(xcrun -sdk iphoneos -find ranlib)

export CFLAGS="-arch ${ARCH} -isysroot $PLATFORMPATH -miphoneos-version-min=$SDKMIN -I$INCLUDE_PATH -I$OPENSSL_ROOT/include -I$TMP_DIR/include"
export CPPFLAGS="-arch ${ARCH} -isysroot $PLATFORMPATH -miphoneos-version-min=$SDKMIN -I$INCLUDE_PATH -I$OPENSSL_ROOT/include -I$TMP_DIR/include"
export LDFLAGS="-arch ${ARCH} -isysroot $PLATFORMPATH -L$LIB_PATH -L$OPENSSL_ROOT/lib"

cd $SRCDIR

prepare_tmp
make clean
run_configure
make
