//
//  ViewController.swift
//  homework3
//
//  Created by Alua Nurakhanova on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFiledName: UITextField!
    @IBOutlet weak var textFiledNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addContact(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let contactName = textFiledName.text!
        
        let contactNumer = textFiledNumber.text!
        var newContactName = ContactsInfo()
        newContactName.name = contactName
        
        newContactName.number = contactNumer
        do {
            if let data = defaults.data(forKey: "ContactInfo"){
                var array = try JSONDecoder().decode([ContactsInfo].self, from: data)
                array.append(newContactName)
                let encodedata = try JSONEncoder().encode(array)
                defaults.set(encodedata, forKey: "ContactInfo")
            }
            else {
                let encodedata = try JSONEncoder().encode([newContactName])
                defaults.set(encodedata, forKey: "ContactInfo")

            }
        }
        catch {
            print("unable to encode \(error)")
        }
        textFiledName.text = ""
        textFiledNumber.text = ""
    }
}


