//
//  ViewController.swift
//  Reactor
//
//  Created by Tamas Bara on 03.02.17.
//  Copyright © 2017 Tamas Bara. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let signal = inputText
            .reactive
            .continuousTextValues
            .skipNil()
            .map{String($0.characters.reversed())}
        
        signal.observeValues { value in
            self.output.text = value
        }
        
        btn.reactive
            .controlEvents(.touchUpInside)
            .observe { value in
            self.inputText
                .resignFirstResponder()
        }
    }
}

