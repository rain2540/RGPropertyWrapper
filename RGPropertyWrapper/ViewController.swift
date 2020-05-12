//
//  ViewController.swift
//  RGPropertyWrapper
//
//  Created by Rain on 2020/4/23.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testModel = TestModel()
        
        print(testModel.storeValue)
        print(testModel.trim)
        print(testModel.replace)
    }


}

