//
//  detailViewController.swift
//  slideOutMenuWithTabVIews
//
//  Created by guitarrkurt on 03/11/15.
//  Copyright © 2015 guitarrkurt. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var figure: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var texto           : String?
    var imageUrlDetail : String!
    var imageData       : NSData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = texto
        
        imageData           = NSData(contentsOfURL: NSURL(string: imageUrlDetail)!)!
        figure.image        = UIImage(data: self.imageData)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
