# O-MOTION SDK for iOS
[![Swift](https://img.shields.io/badge/Swift-F54A2A?logo=swift&logoColor=white)](#)
[![Objective-C](https://img.shields.io/badge/Objective--C-%233A95E3.svg?&logo=apple&logoColor=white)](#)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS-Green?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![CocoaPods](https://img.shields.io/badge/CocoaPods-compatible-E32?style=flat-square)](https://img.shields.io/badge/CocoaPods-compatible-E32?style=flat-square)

O-MOTION is a cloud service for detecting and monitoring "unauthorized logins," "fraudulent account openings and applications," and "BOT attacks" on login screens and account opening/application screens.

## Features
- Detects unauthorized logins in real time
- Delivers detection results instantly
- Does not collect any personally identifiable information (PII)
- Seamlessly integrates with your iOS application
- Supports both CocoaPods and Swift Package Manager
- Lightweight and fast detection logic
- Fully supports Objective-C projects

## Usage
> [!Note]
> See also [SDK document](https://www.notion.so/O-Motion-iOS-SDK-2069a2855fb8809cad58d181d3d870d3)
> 
> ![Notion Badge](https://img.shields.io/badge/Notion-000?logo=notion&logoColor=fff&style=flat-square)

### Initialize SDK
You need to initialize the SDK when the app launches.
``` swift
Omotion.setup(apiKey: "YOUR_API_KEY", appEnv: "PROD") { (_, error) in
    if let error {
        print(error.localizedDescription)
    }
}
```

### Session Beginning
Start a session when loading the screen where you want to perform fraud detection.
The session will automatically end when the screen instance is destroyed.
``` swift
Omotion.startSession()
```

### Fraud Detection (Detection Only)
Checks for potential account misuse.
This method only performs the investigation and does not return any results.
The results can be accessed through the web service dashboard.
``` swift
Omotion.request(
    eventId: "YOUR_EVENT_ID",
    userId: "USERNAME_OR_EMAIL",
    loginSuccess: true,
    loginMethod: .autoFill
) { (_, error) in
    if let error {
        print(error.localizedDescription)
    }
}
```

### Fraud Detection (with Result)
Checks for potential account misuse.
The results are returned as a dictionary.
``` swift
Omotion.requestWithResult(
    eventId: "YOUR_EVENT_ID",
    userId: "USERNAME_OR_EMAIL", 
    loginSuccess: true,
    loginMethod: .biometrics,
    timeout: 1200
) { (response, error) in
    if let data = response?.data {
        print(data)
    }
    if let error {
        print(error.localizedDescription)
    }
}
```

### Give Feedback
If additional authentication, such as biometric authentication, is performed outside of O-MOTION,
you can provide the results as feedback to O-MOTION.
``` swift
Omotion.sendFeedback(feedBack: .OK) { (_, error) in
    if let error {
        print(error.localizedDescription)
    }
}
```

### Monitoring Interaction
Enhance O-MOTION's fraud detection accuracy by monitoring user interactions like keyboard inputs, taps, and swipes.
``` swift
VStack {
    InputTextField(title: "Username", text: $username)
        .onReceive(Just(username)) { _ in
            Omotion.onKeyTap()
        }
}
.simultaneousGesture(
    TapGesture().onEnded { _ in
        Omotion.onViewTapGesture()
    }
)
.simultaneousGesture(
    DragGesture(minimumDistance: 50).onEnded { _ in
        Omotion.onViewSwipeGesture()
    }
)
```

## Installation

### CocoaPods
O-MOTION SDK is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following lines to your Podfile:

```ruby
use_frameworks!
pod 'OMotionSDK'
```

### Swift Package Manager
O-MOTION SDK is also available through [Swift Package Manager](https://github.com/apple/swift-package-manager/).

## Author
Cacco Inc., [Contact us](https://frauddetection.cacco.co.jp/contact/)

## License
O-MOTION SDK is available under the MIT license. See the LICENSE file for more info.