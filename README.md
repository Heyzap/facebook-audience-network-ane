# Facebook Audience Network ANE

A thin wrapper around the Facebook Audience Network Android and iOS SDK for use on Heyzap's mediation.

The latest release can be found in [Releases](https://github.com/Heyzap/facebook-audience-network-ane/releases).

Pull requests and issues are welcome.

#### Facebook Audience Network Versions
- iOS: 4.3.0
- Android: 4.3.0

#### Adding to your project

- Add the `FacebookAudienceNetwork.ane` to your Adobe Flex Builder or Adobe Flash project.
- If on Android, follow the [integration instructions on Heyzap](https://developers.heyzap.com/docs/ane_setup_and_requirements#unityads#facebook-audience-network) or add the following permissions and activities to your Android Manifest in your application descriptor:
 
	```
	<uses-permission android:name="android.permission.INTERNET"/>
	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
	```

	```
	<activity android:name="com.facebook.ads.InterstitialAdActivity" android:configChanges="keyboardHidden|orientation|screenSize" />
	```

- If not done automatically, add the follow extension context to your application descriptor:

	```
	<extensions>
	    <extensionID>com.heyzap.sdk.extensions.facebook.audiencenetwork</extensionID>
	</extensions>
	```

#### Building

Build Requirements:
- Mac OS X
- XCode
- Ant

From the root of the folder, run `ant`.

After build completes, the native extension will be in `bin/FacebookAudienceNetwork.ane`.
