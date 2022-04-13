//
//  DetailsViewController.swift
//  CarRental.1.0
//
//  Created by Hamzah Dalal on 09/04/2022.
//

import UIKit
import Realm
class DetailsViewController: UIViewController {

    @IBOutlet var Image: UIImageView!
    @IBOutlet var Model: UITextField!
    @IBOutlet var Total: UILabel!
    @IBOutlet var ListingLbl: UILabel!
    public var carImage:UIImage! = nil
    public var modelinfo:String = ""
    public var priceTot:String = ""
    public var Listing:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.image = carImage
        Model.text = modelinfo
        Total.text = priceTot
    }

    @IBAction func SlideOn(_ sender: UISwitch) {
        if (sender.isOn){
            ListingLbl.isHidden = false
            Listing = true
        }else{
            ListingLbl.isHidden = true
            Listing = false
        }
}
}
