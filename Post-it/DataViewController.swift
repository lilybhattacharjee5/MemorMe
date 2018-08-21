//
//  DataViewController.swift
//  Post-it
//
//  Created by Lily Bhattacharjee on 8/16/18.
//  Copyright © 2018 Lily Bhattacharjee. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet var appTitle: UILabel!
    @IBOutlet var dataLabel: UILabel!
    var dataObject: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appTitle.text = "MemorMe"
        appTitle.textAlignment = .center
        //btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }


}

