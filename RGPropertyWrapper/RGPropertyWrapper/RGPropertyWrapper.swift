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


    @propertyWrapper
    struct Trimmed {

        private var storage: String!
        private let characterSet: CharacterSet

        var wrappedValue: String {
            get { storage }
            set { storage = newValue.trimmingCharacters(in: characterSet) }
        }

        init(wrappedValue: String) {
            self.characterSet = .whitespacesAndNewlines
            self.wrappedValue = wrappedValue
        }

        init(wrappedValue: String, characterSet: CharacterSet) {
            self.characterSet = characterSet
            self.wrappedValue = wrappedValue
        }
    }
    
}
