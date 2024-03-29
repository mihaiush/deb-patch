export DIST=testing
export SRC=bluez-alsa-utils
export VERSION='r2'

main(){

# AAC
sed -ri 's/dh_auto_configure --/dh_auto_configure -- --enable-aac/' debian/rules
sed -ri 's/^Build-Depends: /Build-Depends: libfdk-aac-dev, /g' debian/control

# APTX
sed -ri 's/dh_auto_configure --/dh_auto_configure -- --enable-aptx --enable-aptx-hd --with-libopenaptx/' debian/rules
sed -ri 's/^Build-Depends: /Build-Depends: libopenaptx-dev, /g' debian/control

}
