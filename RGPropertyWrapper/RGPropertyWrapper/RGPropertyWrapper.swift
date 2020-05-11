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

    /// UserDefaults 存取
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


    /// 去除字符串中的某些字符
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


    /// 字符替换
    @propertyWrapper
    struct Replace {

        static let original = "original"
        static let replace = "replace"

        private var storage: String!
        private let rules: Array<[String: String]>

        var wrappedValue: String {
            get { storage }
            set {
                var res = ""
                rules.forEach {
                    res = newValue.replacingOccurrences(of: $0[Replace.original]!, with: $0[Replace.replace]!)
                }
                storage = res
            }
        }

        init(wrappedValue: String, rules: Array<[String: String]>) {
            self.rules = rules
            self.wrappedValue = wrappedValue
        }

    }
    
}
