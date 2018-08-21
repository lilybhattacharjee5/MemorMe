//
//  NewNoteControllerViewController.swift
//  Post-it
//
//  Created by Lily Bhattacharjee on 8/18/18.
//  Copyright © 2018 Lily Bhattacharjee. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet var newNote: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newNote.text = "New Note";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
