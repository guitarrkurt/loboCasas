//
//  OneViewController.swift
//  slideOutMenuWithTabVIews
//
//  Created by guitarrkurt on 02/11/15.
//  Copyright © 2015 guitarrkurt. All rights reserved.
//

import UIKit

class CasasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!

    var jsonUrl         : String!
    var refreshControl  : UIRefreshControl!
    var recievedData    : NSMutableData?
    var imageUrlArray   : [String]!
    var depositoArray   : [String]!
    var mensualidadArray: [String]!
    var generoArray     : [String]!
    var texto           : String?
    var imageData       : NSData!
    var imageUrlDetail : String!
    
    
    //MARK: - CONSTRUCTOR
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonUrl = "http://localhost:8888/RentaCasas/webservice.php"
        imageUrlArray    = [String]()
        depositoArray    = [String]()
        mensualidadArray = [String]()
        generoArray      = [String]()
        texto            = String()
        imageData        = NSData()
        imageUrlDetail   = String()

        //Menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        //Refresh
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        //Conexion
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
            {
                // do your task...
                var jsonDic = NSDictionary()
                var imagenUrl = String()
                var deposito = String()
                var mensualidad = String()
                var genero = String()
                
                let session = NSURLSession.sharedSession()
                let shotsUrl = NSURL(string: self.jsonUrl)
                let task = session.dataTaskWithURL(shotsUrl!) {
                    (data, response, error) -> Void in
                    
                    do {
                        let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! Array<AnyObject>
                        
                        for i in 0..<jsonData.count{
                            
                            jsonDic = jsonData[i] as! NSDictionary
                            
                            imagenUrl = jsonDic["imagen"] as! String
                            self.imageUrlArray.insert(imagenUrl, atIndex: i)
                            print(imagenUrl)
                            
                            deposito = jsonDic["deposito"] as! String
                            self.depositoArray.append(deposito)
                            print(deposito)
                            
                            mensualidad = jsonDic["mensualidad"] as! String
                            self.mensualidadArray.append(mensualidad)
                            print(mensualidad)
                            
                            genero = jsonDic["genero"] as! String
                            self.generoArray.append(genero)
                            print(genero)
                        }
                        
                    } catch _ {
                        print("Error - Ocurrio error al descargar el JSON")
                    }
                }
                task.resume()
                }
                dispatch_async(dispatch_get_main_queue())
                {
                        // update some UI...
                        self.tableView.reloadData()
                        
                }
        
        
    }
    //Refreshing
    func refresh(sender:AnyObject)
    {

        self.refreshControl.endRefreshing()
    }

    //MARK: - DATASOURCE
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.imageUrlArray.count
    }
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! templateTableViewCell
            self.texto = "DEPOSITO:          \(depositoArray[indexPath.row])\nMENSUALIDAD:  \(mensualidadArray[indexPath.row])\nGENERO:              \(generoArray[indexPath.row])"
            cell.label.text = self.texto
        
            self.imageData           = NSData(contentsOfURL: NSURL(string: imageUrlArray[indexPath.row])!)!
            cell.figura.image        = UIImage(data: self.imageData)
        
        return cell
    }

    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! templateTableViewCell
        texto = "DEPOSITO:          \(depositoArray[indexPath.row])\nMENSUALIDAD:  \(mensualidadArray[indexPath.row])\nGENERO:              \(generoArray[indexPath.row])"
        imageUrlDetail = imageUrlArray[indexPath.row]
        performSegueWithIdentifier("detailIdentifier", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailIdentifier" {
            (segue.destinationViewController as! detailViewController).imageUrlDetail = imageUrlDetail
            (segue.destinationViewController as! detailViewController).texto = texto
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
