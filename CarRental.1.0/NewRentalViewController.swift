//
//  NewRentalViewController.swift
//  CarRental.1.0
//
//  Created by Hamzah Dalal on 09/04/2022.
//

import UIKit
import SwiftUI

class NewRentalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    @IBOutlet var AddImg: UINavigationBar!
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var ButtonImg: UIButton!
    @IBOutlet var ModelText: UITextField!
    @IBOutlet var OneDayButton: UIButton!
    @IBOutlet var ThreeDayButton: UIButton!
    @IBOutlet var SevenDayButton: UIButton!
    @IBOutlet var PriceLbl: UILabel!
    @IBOutlet var TotalLbl: UILabel!
    var globalImage:UIImage? = nil
    public var complete: ((UIImage?, String, String) -> Void)?
    var DayPrice:Double = 0
    var TotalP:Double = 0
    lazy var Button: [UIButton] = [self.OneDayButton,self.ThreeDayButton, self.SevenDayButton]
    var Timeperiod:Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ModelText.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "List", style: .done, target: self, action: #selector(didTapList))
        
    }
    @objc func didTapList(){
        if let make = ModelText.text, !make.isEmpty, AddImg.isHidden {
            complete?(globalImage, make, ("\(TotalLbl.text ?? "")(\(Timeperiod) Day/s)"))
        }
    }
    func TotalPrice(){
        TotalP = (DayPrice * Timeperiod)
        TotalLbl.text = String("£\(TotalP)0")
        
    }
    @IBAction func PriceStep(_ sender: UIStepper!) {
            PriceLbl.text = String("£\(sender.value)0")
            DayPrice = sender.value
            TotalPrice()
        }
    @IBAction func onedayButton(_ sender: UIButton){
        Timeperiod = 1
        let button2 = Button[1]
        let button3 = Button[2]
        if sender.isSelected{
            sender.isSelected = false
            button3.isEnabled = true
            button2.isEnabled = true
        } else{
            sender.isSelected = true
            button3.isEnabled = false
            button2.isEnabled = false
        }
    }
    @IBAction func threedayButton(_ sender: UIButton){
        Timeperiod = 3
        let button1 = Button[0]
        let button3 = Button[2]
        if sender.isSelected{
            sender.isSelected = false
            button3.isEnabled = true
            button1.isEnabled = true
        } else{
            sender.isSelected = true
            button3.isEnabled = false
            button1.isEnabled = false
        }
    }
    @IBAction func sevendayButton(_ sender: UIButton){
        Timeperiod = 7
        let button1 = Button[0]
        let button2 = Button[1]
        if sender.isSelected{
            sender.isSelected = false
            button2.isEnabled = true
            button1.isEnabled = true
        } else{
            sender.isSelected = true
            button2.isEnabled = false
            button1.isEnabled = false
        }
    }
        
    @IBAction func ImgInput(){
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            image.allowsEditing = true
            self.present(image,animated: true)
            
        }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            UserImage.image = image
            AddImg.isHidden = true
            ButtonImg.isHidden = false
            globalImage = image
        }
        self.dismiss(animated: true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ModelText.resignFirstResponder()
        return true
    }


}
