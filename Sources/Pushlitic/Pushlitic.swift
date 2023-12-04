//
//  File.swift
//  
//
//

import Foundation
import Pushlitica

@objc(Pushlitic)
public class Pushlitic : NSObject {
    @objc public init(_ key:String) {
        Pushlitica.setup(ukey: key)
    }
}
