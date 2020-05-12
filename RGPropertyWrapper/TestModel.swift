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
    var trim: String = "  1 2 3  "

    @RGPW.Replace(rules: [[RGPW.Replace.original: "=", RGPW.Replace.replace: "-"]])
    var replace: String = "1=2=3"

}
