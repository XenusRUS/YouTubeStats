//
//  ViewController.swift
//  Youtube Stats
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 vadim. All rights reserved.
// AIzaSyDLvbN2Z-s_MElyKBFZ4R06K12PvGtyZy4 API KEY

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var channelNameTextField: UITextField!
    
    let APIkey = "AIzaSyDLvbN2Z-s_MElyKBFZ4R06K12PvGtyZy4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getStat()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getStat() {
        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/channels", parameters: ["part":"snippet", "forUsername":channelNameTextField.text!, "key":APIkey], encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) -> Void in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }

        }
    }
    
    @IBAction func confirmButton(sender: AnyObject) {
        if channelNameTextField.text == "" {
            let alertController = UIAlertController(title: "Название YouTube канала не введено", message:"Введите название YoutTube канала", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            getStat()
        }
    }
    


}

