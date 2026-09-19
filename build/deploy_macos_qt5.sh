#!/bin/sh

export BUILD_ROOT="$PWD"

if [ -z "$LITEIDE_ROOT" ]; then
	export LITEIDE_ROOT="$PWD/../liteidex"
fi

echo deploy liteide/LiteIDE.app
echo QTDIR=$QTDIR
echo GOROOT=$GOROOT
echo BUILD_ROOT=$BUILD_ROOT
echo LITEIDE_ROOT=$LITEIDE_ROOT
echo .

if [ -n "$QTDIR" ]; then
	export PATH="$QTDIR/bin:$PATH"
fi

if ! command -v macdeployqt >/dev/null 2>&1; then
	echo 'error, macdeployqt not found in PATH'
	exit 1
fi

rm -f liteide/LiteIDE.app/Contents/Resources/qt.conf
macdeployqt liteide/LiteIDE.app || exit 1
# Hardened Runtime is required on Apple Silicon so CoreText/ImageIO can decode
# Apple Color Emoji (otherwise the editor crashes at 0xbad4007 while painting).
codesign --force --deep --options runtime --entitlements "$LITEIDE_ROOT/src/liteide/LiteIDE.entitlements" --sign - liteide/LiteIDE.app || exit 1
