# get config data
eval `sed '/^ *#/d;s/:/ /;' < "config/build.config" | while read key val
do
    str="$key='$val'"
    echo "$str"
done`

# make sure air sdk is extracted
if [ ! -f "air/sdk/bin/compc" ]; then
  mkdir -p air
  cd air
  if [ ! -f airsdk.tbz2 ]; then
    echo "Downloading AIR SDK..."
    curl -o airsdk.tbz2 http://airdownload.adobe.com/air/mac/download/latest/AIRSDK_Compiler.tbz2
  fi
  mkdir -p sdk
  cd sdk
  echo "Untarring AIR SDK..."
  tar -xjf ../airsdk.tbz2
  cd ../..
fi
air_sdk=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/"air/sdk"

# Clean
echo "Clean..."
rm -fr build
rm -fr bin
echo " "

# build action script library
echo "Building Actionscript Library..."
"$air_sdk/bin/compc" -source-path actionscript/src -output actionscript/bin/Facebook.swc -swf-version=14 -external-library-path="$air_sdk/frameworks/libs/air/airglobal.swc" -include-classes com.heyzap.sdk.extensions.facebook.audiencenetwork.Dummy
echo " "

# build iOS library
echo "Building iOS Native..."
xcodebuild -project native_ios/FacebookANE/FacebookANE.xcodeproj -target 'FacebookANE' -configuration 'Release' CONFIGURATION_BUILD_DIR='../bin' build
echo " "

echo "Building out folder structure..."
mkdir -p bin
mkdir -p build
mkdir -p build/android
mkdir -p build/ios
mkdir -p build/default

echo "Building Android..."
cd native_android
ant
cd ../

# build ANE
echo "Build Adobe Native Extension..."
cp actionscript/bin/Facebook.swc build/Facebook.swc
cp native_ios/bin/libFacebookANE.a build/ios
cp -R native_android/bin/* build/android
unzip -o build/Facebook.swc -d build/android
cp -R android/* build/android/


unzip -o build/Facebook.swc -d build/ios
cp -R -L ios/FBAudienceNetwork.framework build/

mkdir -p build/default
unzip -o build/Facebook.swc -d build/default

rm -fr build/android/catalog.xml
rm -fr build/ios/catalog.xml
rm -fr build/default/catalog.xml

cd build
"$air_sdk/bin/adt" -package -target ane FacebookAudienceNetwork.ane ../config/extension.xml  -swc Facebook.swc -platform Android-ARM  -platformoptions ../config/android_platform.xml -C android . -platform iPhone-ARM -platformoptions ../config/ios_platform.xml FBAudienceNetwork.framework -C ios . -platform default -C default .
cd ..
cp build/FacebookAudienceNetwork.ane bin/FacebookAudienceNetwork.ane
echo "Complete..."