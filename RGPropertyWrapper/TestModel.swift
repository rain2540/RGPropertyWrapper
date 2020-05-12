//
//  TestModel.swift
//  RGPropertyWrapper
//
//  Created by RAIN on 2020/5/12.
//  Copyright © 2020 Smartech. All rights reserved.
//

import Foundation


struct TestModel {

    @RGPW.UserDefault(key: "Store", defaultValue: 0)
    var storeValue: Int

    @RGPW.Trimmed
    var trim: String

}
