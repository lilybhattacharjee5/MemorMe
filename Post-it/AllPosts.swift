//
//  AllPosts.swift
//  Post-it
//
//  Created by Lily Bhattacharjee on 8/19/18.
//  Copyright © 2018 Lily Bhattacharjee. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    
    var padding:UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    
    required init(frame: CGRect, padding: UIEdgeInsets) {
        super.init(frame: frame)
        self.padding = padding
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let changedRect: CGRect = CGRect(x: (rect.origin.x + padding.left), y: (rect.origin.y + padding.top), width: (rect.size.width - (padding.left + padding.right)), height: (rect.size.height - (padding.top + padding.bottom)))
        super.drawText(in: changedRect)
    }
    
}

class AllPosts: UIViewController {
    
    @IBOutlet var newPost: UIButton!
    @IBOutlet var goBack: UIButton!
    static var storedPosts: Array<UILabel> = Array()
    static var currX: Int = 0
    static var currY: Int = 400
    static let currWidth: Int = 160
    static var currHeight: Int = 0
    static let screenWidth: Int = 320
    static let screenHeight: Int = 480
    static var toggleSide: Bool = false
    
    @IBOutlet var allMemsTitle: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        allMemsTitle.text = "All Mems"
        allMemsTitle.textAlignment = .center
        if (NewNote.postMade) {
            for u in AllPosts.storedPosts {
                scrollView.addSubview(u)
            }
            let carriedPost: String = NewNote.newPost
            if carriedPost != "" {
                AllPosts.currHeight = calcHeight(s: carriedPost)
                if !AllPosts.toggleSide {
                    AllPosts.currY -= AllPosts.currHeight
                }
                let newLabel: CustomLabel = CustomLabel(frame: CGRect(x: AllPosts.currX, y: AllPosts.currY, width: AllPosts.currWidth, height: AllPosts.currHeight), padding: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
                //newLabel.textAlignment = .center
                newLabel.text = carriedPost
                let currColor = NewNote.rgbVals[NewNote.selectedColor]
                let red = Float(currColor[0])
                let green = Float(currColor[1])
                let blue = Float(currColor[2])
                newLabel.backgroundColor = UIColor.init(red:CGFloat(red/255.0), green:CGFloat(green/255.0), blue:CGFloat(blue/255.0), alpha:CGFloat(1));
                newLabel.numberOfLines = AllPosts.currHeight / 20
                newLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
                NSLayoutConstraint(item: newLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: newLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
                scrollView.addSubview(newLabel)
                AllPosts.storedPosts.append(newLabel)
                NewNote.newPost = ""
                AllPosts.currX = 170 - AllPosts.currX
                AllPosts.toggleSide = !AllPosts.toggleSide
            }
            
        }
        scrollView.contentSize = CGSize(width: AllPosts.screenWidth, height: AllPosts.screenHeight)
        goBack.setTitle("Back", for: .normal)
        newPost.setTitle("New Post", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calcHeight(s: String) -> Int {
        let numChars: Int = s.characters.count
        var numLines: Float = Float(numChars) / 16
        numLines.round(.up)
        return (Int(numLines) + 5) * 20
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
