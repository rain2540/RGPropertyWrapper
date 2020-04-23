//
//  RGPropertyWrapper.swift
//  RGPropertyWrapper
//
//  Created by Rain on 2020/4/23.
//  Copyright © 2020 Smartech. All rights reserved.
//

import Foundation


public typealias RGPW = RGPropertyWrapper


public struct RGPropertyWrapper {
    
    @propertyWrapper
    public struct UserDefault<T> {
        let key: String
        let defaultValue: T

        public var wrappedValue: T {
            get {
                return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            }
            set {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }

        public init(key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }
    }
    
}
