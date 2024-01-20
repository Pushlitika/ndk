# Pushlitic Integration

Pushlitic SDK combines all the tools for analytics and tracking tool in one solution.
Allows you to manage, set up detailed statistics and push marketing using one convenient source of truth.
If you want to use our tool in your project, please contact us and we will provide you with the api key.

This is a simple guide on how to integrate Pushlitika into your project.


### **If your project is Unity based you need a different [guide](README_UNITY.md).**


## Dependency 
Add SDK swift package dependencies to project: [https://github.com/Pushlitika/ndk.git](https://github.com/Pushlitika/ndk.git).
And set branch **bottom**
 
## Info.plist setup
After dependency is continue processing, go to INFO tab, and setup some necessary fields:

> NSAdvertisingAttributionReportEndpoint : https://appsflyer-skadnetwork.com/

> ITSAppUsesNonExemptEncryption  :  NO

> NSUserTrackingUsageDescription : Select "Allow" for better experience. This identifier will be used to  order to functionalities and user engagement.

> NSLocationWhenInUseUsageDescription : Select "Allow" for better experience. Your location will be used to order to user engagement.

> NSLocationAlwaysAndWhenInUseUsageDescription : Select "Allow" for better experience. Your location will be used to order to user engagement.

### Also if you develop a game app, you need additional options for better expirience

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

## Code setup
Great, Almost everything is done, the next steps depend on the type of project you have, **SwiftUI** or **UIKit** based.

#### SwiftUI based application

Find your main application struct (**it marks @main**), import SDK:

```Swift
import PushliticNDK
```

And just add init method with a SDK init, set key value.

```Swift
init() {
     PushliticNDK("EXAMPLE_KEY")
}
```

Result code must looks like that:

```Swift
import SwiftUI
import PushliticNDK

@main
struct modernApp: App {
  
    init() {
         PushliticNDK("EXAMPLE_KEY")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

*Target project is ready , Build test and publish project in original way.*

#### UIKit based application

Update **AppDelegate.swift** file, import SDK:

```Swift
import Pushlitic
```

And just add init method with a SDK init, set key value.

```Swift
override init() {
     PushliticaNDK.setup(catkey:"EXAMPLE_KEY")
}
```

Summary example of code:

```Swift
import PushliticNDK
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    override init() {
         PushliticaNDK.setup(catkey:"EXAMPLE_KEY")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
}

```

*Target project is ready , Build test and publish project in original way.*


