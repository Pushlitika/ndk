// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PushliticNDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PushliticNDK",
            targets: ["PushliticNDK"]),
    ],

    dependencies: [
        .package(
            url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework.git", from: "6.9.0"),
        .package(
            url: "https://github.com/facebook/facebook-ios-sdk.git", branch: "main"),
        .package(
            url: "https://github.com/saoudrizwan/Disk",  branch: "master"),
        .package(
            url: "https://github.com/OneSignal/OneSignal-iOS-SDK",  branch: "main"),
        .package(
            url: "https://github.com/airbnb/lottie-ios", from: "4.3.4"),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk", from: "9.6.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PushliticNDK",
            dependencies: [
                .target(name: "PushliticaNDK"),
                .target(name: "TikTokOpenSDK"),
                .target(name: "WonderPush"),
                .target(name: "GameAnalytics"),
                
                .product(name: "OneSignalFramework", package: "OneSignal-iOS-SDK"),
                .product(name: "OneSignalInAppMessages", package: "OneSignal-iOS-SDK"),
                .product(name: "OneSignalLocation", package: "OneSignal-iOS-SDK"),
                .product(name: "OneSignalExtension", package: "OneSignal-iOS-SDK"),

                .product(name: "AppsFlyerLib", package: "AppsFlyerFramework"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "Disk", package: "Disk"),
                
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
            ],  
            resources: [
                .process("waita.json")] ),
        
        .binaryTarget(
            name: "PushliticaNDK",
            path: "./Sources/PushliticaNDK.xcframework"),
    
        .binaryTarget(
            name: "TikTokOpenSDK",
            path: "./Sources/TikTokOpenSDK.xcframework"),
        
        .binaryTarget(
            name: "WonderPush",
            path: "./Sources/WonderPush.xcframework"),
        
        .binaryTarget(
            name: "GameAnalytics",
            path: "./Sources/GameAnalytics.xcframework"),
    ]
)
