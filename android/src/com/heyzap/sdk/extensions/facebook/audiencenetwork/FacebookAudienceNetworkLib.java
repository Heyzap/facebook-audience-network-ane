package com.heyzap.sdk.extensions.facebook.audiencenetwork;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class FacebookAudienceNetworkLib
  implements FREExtension
{
  public FREContext createContext(String args)
  {
    return new FacebookAudienceNetworkLibContext();
  }

  public void dispose() {}

  public void initialize() {}
}