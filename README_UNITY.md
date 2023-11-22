#  Pushlitic Integration

Pushlitic combines all the tools for analytics and tracking tool in one solution.
Allows you to manage, set up detailed statistics and push marketing using one convenient source of truth.
If you want to use our tool in your project, please contact us and we will provide you with the api key.

This is a simple guide on how to integrate Pushlitic into your UNITY generated project.

## Generation

Export iOS Unity project in In the usual way, and open project via xcode. Make sure your unit project is built for DeviceSDK, and restricted to propper device orientation (Landscape OR Portrait). 
    
**Open player settings (Edit → Project Settings → Player) and open the “Resolution and Presentation” section. Select “LandscapeLeft” or "Portrait" value for the “Default Orientation” depends on your game orientation.**
    
Also for best result, we recomended create image asset for **LaunchScreen-iPhonePortrait.png** and **LaunchScreen-iPhoneLandscape.png** images.
this will help make the game more attractive

## Dependency 
 Add SDK swift package dependencies to project: [https://github.com/Pushlitika/Pushlitic](https://github.com/Pushlitika/Pushlitic)

## Info.plist setup
After dependency is continue processing, go to INFO tab, and setup some necessary fields:

> NSAdvertisingAttributionReportEndpoint : https://appsflyer-skadnetwork.com/

> ITSAppUsesNonExemptEncryption  :  NO

> NSUserTrackingUsageDescription : Select "Allow" for better experience. This identifier will be used to  order to functionalities and user engagement.

> NSLocationWhenInUseUsageDescription : Select "Allow" for better experience. Your location will be used to order to user engagement.

> NSCameraUsageDescription : Select "Allow" for better experience. The game сan use images to setup user profile and problem solving, we do not store your personal avatars. 

> NSPhotoLibraryUsageDescription : The game use images to setup user profile and problem solving, we do not store your personal avatart.

#### Next step is enable **Push Notification** on Capability editor:

![enter image description here](https://i.imgur.com/bg1UMSz.png)


#### Review your Deployment Info tab, accordint to image
**Enable here ALL AVAILABLE orientation, and valid value to Launch Screen File!** 
This is Extremely important for the operation of advertising blocks!

![enter image description here](https://i.imgur.com/g1HDkvC.png)

### SDK Configuration
SDK init by api key, so you need **api key** ask your manager about it, example key is **EXAMPLE_KEY**.

## Update code

Navigate to project **main.mm** file and update code by adding SDK:

```objective-c
#include <Pushlitica/Pushlitica-Swift.h>
```

and init call:
```objective-c
[Pushlitic init: @"EXAMPLE_KEY"];
```

You need replace key value with propper sdk api key.

```objective-c
#include <UnityFramework/UnityFramework.h>
#include <Pushlitica/Pushlitica-Swift.h>

UnityFramework* UnityFrameworkLoad()
{
    NSString* bundlePath = nil;
    bundlePath = [[NSBundle mainBundle] bundlePath];
    bundlePath = [bundlePath stringByAppendingString: @"/Frameworks/UnityFramework.framework"];

    NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
    if ([bundle isLoaded] == false) [bundle load];

    UnityFramework* ufw = [bundle.principalClass getInstance];
    if (![ufw appController])
    {
        // unity is not initialized
        [ufw setExecuteHeader: &_mh_execute_header];
    }
    
    return ufw;
}

int main(int argc, char* argv[])
{
    @autoreleasepool
    {
        [Pushlitic init: @"EXAMPLE_KEY"]; //SDK ENDPOINT IS HERE
    
        id ufw = UnityFrameworkLoad();
        [ufw runUIApplicationMainWithArgc: argc argv: argv];
        
        return 0;
    }
}
```

*Target project is ready , Build test and publish project in original way.*





