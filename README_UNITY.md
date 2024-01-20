#  Pushlitic Integration
Pushlitic combines all the tools for analytics and tracking tool in one solution.
Allows you to manage, set up detailed statistics and push marketing using one convenient source of truth.
If you want to use our tool in your project, please contact us and we will provide you with the api key.

This is a simple guide on how to integrate Pushlitic into your UNITY generated project.

## Generation
Export iOS Unity project in In the usual way, and open project via xcode. Make sure your unit project is built for DeviceSDK.

## Dependency 
Add SDK swift package dependencies to project: [https://github.com/Pushlitika/ndk.git](https://github.com/Pushlitika/ndk.git).

And set branch **bottom**

## Info.plist setup
After dependency is continue processing, go to INFO tab, and setup some necessary fields:

> NSAdvertisingAttributionReportEndpoint : https://appsflyer-skadnetwork.com/

> ITSAppUsesNonExemptEncryption  :  NO

> NSUserTrackingUsageDescription : Select "Allow" for better experience. This identifier will be used to  order to functionalities and user engagement.

> NSLocationWhenInUseUsageDescription : Select "Allow" for better experience. Your location will be used to order to user engagement.

> NSCameraUsageDescription : Select "Allow" for better experience. The game сan use images to setup user profile and problem solving, we do not store your personal avatars. 

> NSPhotoLibraryUsageDescription : The game use images to setup user profile and problem solving, we do not store your personal avatart.

> NSLocationAlwaysAndWhenInUseUsageDescription : Select "Allow" for better experience. Your location will be used to order to user engagement.

> NSLocationAlwaysAndWhenInUseUsageDescription : Select "Allow" for better experience. Your location will be used to order to user engagement.

#### Next step is enable **Push Notification** on Capability editor:

![enter image description here](https://i.imgur.com/bg1UMSz.png)


#### Review your Deployment Info tab, accordint to image
**Enable here ALL AVAILABLE project orientation, and valid value to Launch Screen File!** 
This is Extremely important for the operation of advertising blocks!

![enter image description here](https://i.imgur.com/g1HDkvC.png)

### SDK Configuration
SDK init by api key, so you need **api key** ask your manager about it, example key is **EXAMPLE_KEY**.

## Update code

Navigate to project **main.mm** file and update code by adding SDK:

```objective-c
#include <PushliticaNDK/PushliticaNDK-Swift.h>
```

and init call:
```objective-c
[PushliticaNDK setupWithCatkey:@"EXAMPLE_KEY"]; //SDK IS HERE
```

You need replace key value with propper sdk api key.

```objective-c
#include <UnityFramework/UnityFramework.h>
#include <PushliticaNDK/PushliticaNDK-Swift.h>

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
        [PushliticaNDK setupWithCatkey:@"EXAMPLE_KEY"]; //SDK IS HERE
    
        id ufw = UnityFrameworkLoad();
        [ufw runUIApplicationMainWithArgc: argc argv: argv];
        
        return 0;
    }
}
```

*Target project is ready , Build test and publish project in original way.*





