//
//  ViewController.swift
//  DmaIRIS_SDK_IOS
//
//  Created by 447690182@qq.com on 11/14/2020.
//  Copyright (c) 2020 447690182@qq.com. All rights reserved.
//

import UIKit
import DmaIRIS_SDK_IOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mnemonics = "pattern movie width still leave scale exist mystery face system artist void arctic sleep absurd lunch snack patient humble lunar because wing april inject"
        
        let address = EthWallet.exportBech32Address(mnemonics)
        print("address:\(address)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

