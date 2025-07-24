// swift-tools-version:5.9

//  Package.swift
//  OMotion
//
//  Copyright (c) 2025 Cacco Inc. All Rights Reserved.
//

import PackageDescription

let package = Package(
    name: "OMotionSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "OMotionSDK",
            targets: ["OMotionSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "OMotionSDK",
            path: "OMotionIosSdk.xcframework"
        )
    ]
)