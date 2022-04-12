//
//  ViewController.swift
//  CarRental.1.0
//
//  Created by Hamzah Dalal on 09/04/2022.
//

import UIKit
import Realm
import SwiftUI
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var MainImg: UIImageView!
    @IBOutlet var table: UITableView!
    var models: [(image: UIImage?, title: String, details: String)] = []
    var Imagearray: [UIImage] = [
        UIImage(named: "Car")!,
        UIImage(named: "Car2")!,
        UIImage(named: "Car3")!
    ]
    var position = 0
    public var hi = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
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
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = models[indexPath.row].image
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].details
        
        
        
        return cell
    }
    @IBAction func Onclick(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Create") as? NewRentalViewController else{
            return
        }
        vc.complete = {image ,notetitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((image: image, title: notetitle, details: note))
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsViewController else{
            return
        }
        
       
        vc.carImage = model.image
        vc.modelinfo = model.title
        vc.priceTot = model.details
        
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            tableView.beginUpdates()
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
