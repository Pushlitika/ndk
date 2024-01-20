//
//  File.swift
//  
//
//

import Foundation
import PushliticaNDK

@objc(PushliticNDK)
public class PushliticNDK : NSObject {
    @objc public init(_ key:String) {
        PushliticaNDK.setup(catkey: key)
    }
}
