//
//  ViewController.swift
//  CarRental.1.0
//
//  Created by Hamzah Dalal on 09/04/2022.
//

import UIKit
import Realm
import SwiftUI
class ViewController: UIViewController{

    @IBOutlet var MainImg:UIImageView!
    @IBOutlet var TableV:UITableView!
    var Imagearray: [UIImage] = [
        UIImage(named: "Car")!,
        UIImage(named: "Car2")!,
        UIImage(named: "Car3")!
    ]
    var position = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Showcase()
        
    }

    func Showcase(){
        MainImg.image = Imagearray[position]
    }
    @IBAction func Swipe(){
        MainImg.image = Imagearray[position]
        position += 1
        if(position == 3){
          position = 0
        }
    }
}

 
