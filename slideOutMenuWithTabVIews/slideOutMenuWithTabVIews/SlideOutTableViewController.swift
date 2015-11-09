//
//  SlideOutTableViewController.swift
//  slideOutMenuWithTabVIews
//
//  Created by guitarrkurt on 09/11/15.
//  Copyright © 2015 guitarrkurt. All rights reserved.
//

import UIKit

class SlideOutTableViewController: UITableViewController {

    @IBOutlet weak var logo: UITableViewCell!
    @IBOutlet weak var perfil: UITableViewCell!
    @IBOutlet weak var casas: UITableViewCell!
    @IBOutlet weak var registro: UITableViewCell!
    @IBOutlet weak var contacto: UITableViewCell!
    @IBOutlet weak var acercade: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "blueImage")!)
        self.tableView.separatorColor = UIColor.clearColor()
        
        logo.backgroundColor = UIColor.clearColor()
        perfil.backgroundColor = UIColor.clearColor()
        casas.backgroundColor = UIColor.clearColor()
        registro.backgroundColor = UIColor.clearColor()
        contacto.backgroundColor = UIColor.clearColor()
        acercade.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
