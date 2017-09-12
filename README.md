# Facebook Audience Network ANE

A thin wrapper around the Facebook Audience Network Android and iOS SDK for use on Heyzap's mediation.

The latest release can be found in [Releases](https://github.com/Heyzap/facebook-audience-network-ane/releases).

Pull requests and issues are welcome.

#### Facebook Audience Network Versions
- iOS: 4.25.0
- Android: 4.25.0

#### Adding to your project

- Add the `FacebookAudienceNetwork.ane` to your Adobe Flex Builder or Adobe Flash project.
- If on Android, follow the [integration instructions on Heyzap](https://developers.heyzap.com/docs/ane_setup_and_requirements#step-3-modify-your-application-descriptor) or add the following permissions and activities to your Android Manifest in your application descriptor:
 
	```xml
	<uses-permission android:name="android.permission.INTERNET"/>
	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
	```

	```xml
  <activity android:name="com.facebook.ads.AudienceNetworkActivity" android:configChanges="keyboardHidden|orientation|screenSize" />
	```

- If not done automatically, add the follow extension context to your application descriptor:

	```xml
	<extensions>
	    <extensionID>com.heyzap.sdk.extensions.facebook.audiencenetwork</extensionID>
	</extensions>
	```

#### Updating Facebook Audience Network
**For iOS**:
- Replace `FBAudienceNetwork.framework` in `ios/Vendor` with a newer version.
- Update `ios/platform.xml` with any new iOS frameworks that the newer version might be dependent on. Built-in iOS SDK frameworks can be added within the _linkerOptions_ tag. Custom iOS frameworks can be added under the _packagedDependencies_ tag and their respective `.framework` directories can be added to `ios/Vendor`. Drag and drop these `.framework` directories into the `FacebookANE.xcodeproj` project in XCode under the _Vendor_ group.

**For Android**:
- Replace `AudienceNetwork.jar` in `android/libs` with a newer version. Get the newer version from an `.aar` by unzipping it and renaming `classes.jar` to `AudienceNetwork.jar`.
- Update `android/platform.xml` with any new android libraries that the newer version might be dependent on. Android libraries can be added under the _packagedDependencies_ tag. The actual `.jar` files can be added to the `andorid/libs` directory.

After making the necessary modifications, build the new ANE by following the [building](#building) instructions below.

#### Building

##### Requirements:
- Mac OS X
- XCode **8** (as of FAN 4.23.0, 7 is not supported)
- [Apache Ant](http://ant.apache.org/)
- [AIR SDK](http://www.adobe.com/devnet/air/air-sdk-download.html)

##### Building:
- Make a `build.config` by copying `build.config.dist` (your local config file)
- Add the path to your AIR SDK in `build.config` (under `air.sdk`)
- From the root of the repository, run `ant`.

After build completes, the native extension will be in `bin/FacebookAudienceNetwork.ane`.
