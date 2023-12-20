export DIST=testing
export SRC=ffmpegfs

main(){

cd ffmpegfs-*
cat >autocopy_strict.patch.b64 <<EOF
ZGlmZiAtLWdpdCBhL3NyYy9mZm1wZWdfdHJhbnNjb2Rlci5jYyBiL3NyYy9mZm1wZWdfdHJhbnNj
b2Rlci5jYwppbmRleCAzNmZhZTQwOC4uNDViZTM5MjEgMTAwNjQ0Ci0tLSBhL3NyYy9mZm1wZWdf
dHJhbnNjb2Rlci5jYworKysgYi9zcmMvZmZtcGVnX3RyYW5zY29kZXIuY2MKQEAgLTc5Nyw2ICs3
OTcsMjkgQEAgYm9vbCBGRm1wZWdfVHJhbnNjb2Rlcjo6Y2FuX2NvcHlfc3RyZWFtKGNvbnN0IEFW
U3RyZWFtICpzdHJlYW0pIGNvbnN0CiAgICAgICAgIHJldHVybiBmYWxzZTsKICAgICB9CiAKKyAg
ICBBVk1lZGlhVHlwZSBjb2RlY190eXBlID0gc3RyZWFtLT5jb2RlY3Bhci0+Y29kZWNfdHlwZTsK
KyAgICBBVkNvZGVjSUQgY29kZWNfaW4gPSBzdHJlYW0tPmNvZGVjcGFyLT5jb2RlY19pZDsKKyAg
ICBzdGQ6OnN0cmluZyBjb2RlY190eXBlX3N0cjsKKyAgICBBVkNvZGVjSUQgY29kZWNfb3V0Owor
ICAgIGludDY0X3QgYml0cmF0ZV9vdXQ7CisgICAgaWYgKGNvZGVjX3R5cGUgPT0gQVZNRURJQV9U
WVBFX1ZJREVPKQorICAgIHsKKyAgICAgICAgY29kZWNfdHlwZV9zdHIgPSAidmlkZW8iOworICAg
ICAgICBjb2RlY19vdXQgPSBtX2N1cnJlbnRfZm9ybWF0LT52aWRlb19jb2RlYygpOworICAgICAg
ICBiaXRyYXRlX291dCA9IHBhcmFtcy5tX3ZpZGVvYml0cmF0ZTsKKyAgICB9CisgICAgZWxzZSBp
ZiAoY29kZWNfdHlwZSA9PSBBVk1FRElBX1RZUEVfQVVESU8pCisgICAgeworICAgICAgICBjb2Rl
Y190eXBlX3N0ciA9ICJhdWRpbyI7CisgICAgICAgIGNvZGVjX291dCA9IG1fY3VycmVudF9mb3Jt
YXQtPmF1ZGlvX2NvZGVjKCk7CisgICAgICAgIGJpdHJhdGVfb3V0ID0gcGFyYW1zLm1fYXVkaW9i
aXRyYXRlOworICAgIH0KKyAgICBlbHNlCisgICAgeworICAgICAgICAvLyBDb2RlYyBpcyBub3Qg
dmlkZW8gb3IgYXVkaW8KKyAgICAgICAgcmV0dXJuIGZhbHNlOworICAgIH0KKwogICAgIGlmICgo
cGFyYW1zLm1fYXV0b2NvcHkgPT0gQVVUT0NPUFlfTUFUQ0ggfHwgcGFyYW1zLm1fYXV0b2NvcHkg
PT0gQVVUT0NPUFlfTUFUQ0hMSU1JVCkpCiAgICAgewogICAgICAgICAvLyBBbnkgY29kZWMgc3Vw
cG9ydGVkIGJ5IG91dHB1dCBmb3JtYXQgT0sKQEAgLTgxMCw3ICs4MzMsOCBAQCBib29sIEZGbXBl
Z19UcmFuc2NvZGVyOjpjYW5fY29weV9zdHJlYW0oY29uc3QgQVZTdHJlYW0gKnN0cmVhbSkgY29u
c3QKICAgICBlbHNlIGlmICgocGFyYW1zLm1fYXV0b2NvcHkgPT0gQVVUT0NPUFlfU1RSSUNUIHx8
IHBhcmFtcy5tX2F1dG9jb3B5ID09IEFVVE9DT1BZX1NUUklDVExJTUlUKSkKICAgICB7CiAgICAg
ICAgIC8vIE91dHB1dCBjb2RlYyBtdXN0IHN0cmljdGx5IG1hdGNoCi0gICAgICAgIGlmIChzdHJl
YW0tPmNvZGVjcGFyLT5jb2RlY19pZCAhPSBtX2N1cnJlbnRfZm9ybWF0LT5hdWRpb19jb2RlYygp
KQorICAgICAgICBMb2dnaW5nOjpkZWJ1Zyh2aXJ0bmFtZSgpLCAiQ2hlY2sgYXV0b2NvcHkgc3Ry
aWN0OiAlMTogJTIgLT4gJTMiLCBjb2RlY190eXBlX3N0ci5jX3N0cigpLCBhdmNvZGVjX2dldF9u
YW1lKGNvZGVjX2luKSwgYXZjb2RlY19nZXRfbmFtZShjb2RlY19vdXQpKTsKKyAgICAgICAgaWYg
KGNvZGVjX2luICE9IGNvZGVjX291dCkKICAgICAgICAgewogICAgICAgICAgICAgLy8gRGlmZmVy
ZW50IGNvZGVjcyAtIG5vIGF1dG8gY29weQogICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwpAQCAt
ODIwLDcgKzg0NCw3IEBAIGJvb2wgRkZtcGVnX1RyYW5zY29kZXI6OmNhbl9jb3B5X3N0cmVhbShj
b25zdCBBVlN0cmVhbSAqc3RyZWFtKSBjb25zdAogICAgIGlmIChwYXJhbXMubV9hdXRvY29weSA9
PSBBVVRPQ09QWV9NQVRDSExJTUlUIHx8IHBhcmFtcy5tX2F1dG9jb3B5ID09IEFVVE9DT1BZX1NU
UklDVExJTUlUKQogICAgIHsKICAgICAgICAgQklUUkFURSBvcmlnX2JpdF9yYXRlID0gKHN0cmVh
bS0+Y29kZWNwYXItPmJpdF9yYXRlICE9IDApID8gc3RyZWFtLT5jb2RlY3Bhci0+Yml0X3JhdGUg
OiBtX2luLm1fZm9ybWF0X2N0eC0+Yml0X3JhdGU7Ci0gICAgICAgIGlmIChnZXRfb3V0cHV0X2Jp
dF9yYXRlKG9yaWdfYml0X3JhdGUsIHBhcmFtcy5tX2F1ZGlvYml0cmF0ZSkpCisgICAgICAgIGlm
IChnZXRfb3V0cHV0X2JpdF9yYXRlKG9yaWdfYml0X3JhdGUsIGJpdHJhdGVfb3V0KSkKICAgICAg
ICAgewogICAgICAgICAgICAgLy8gQml0IHJhdGUgY2hhbmdlZCwgbm8gYXV0byBjb3B5CiAgICAg
ICAgICAgICBMb2dnaW5nOjppbmZvKHZpcnRuYW1lKCksICJCZWNhdXNlIHRoZSBiaXQgcmF0ZSBo
YXMgY2hhbmdlZCwgbm8gYXV0byBjb3B5IGlzIHBvc3NpYmxlLiIpOwo=
EOF

base64 -d autocopy_strict.patch.b64 | patch -p1

}