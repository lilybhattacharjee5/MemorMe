//
//  NewNote.swift
//  Post-it
//
//  Created by Lily Bhattacharjee on 8/19/18.
//  Copyright © 2018 Lily Bhattacharjee. All rights reserved.
//

import UIKit

class NewNote: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var backFromNewNote: UIButton!
    @IBOutlet var newNoteDir: UILabel!
    @IBOutlet var noteBlank: UITextView!
    @IBOutlet var postNote: UIButton!
    @IBOutlet var colorPicker: UIPickerView!
    static var newPost: String!
    static var postMade: Bool = false
    static let rgbVals: Array<Array<Int>> = [[224, 130, 131],
                                            [129, 207, 224],
                                            [162, 222, 208],
                                            [253, 227, 167],
                                            [200, 247, 197]]
    static let colors = ["Red", "Blue", "Aqua", "Orange", "Green"]
    static var selectedColor: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colorPicker.dataSource = self
        colorPicker.delegate = self
        newNoteDir.text = "Use the space below to write a note!"
        newNoteDir.textAlignment = .center
        backFromNewNote.setTitle("Back", for: .normal)
        noteBlank.text = "Start writing!"
        postNote.setTitle("Post!", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func post(_ sender: Any) {
        NewNote.newPost = noteBlank.text
        NewNote.postMade = true
        NewNote.selectedColor = colorPicker.selectedRow(inComponent: 0)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Column count: use one column.
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        
        // Row count: rows equals array length.
        return NewNote.colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        // Return a string from the array for this row.
        return NewNote.colors[row]
    }

}
