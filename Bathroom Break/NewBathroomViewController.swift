//
//  NewBathroomViewController.swift
//  Bathroom Break
//
//  Created by Christopher Dabalsa on 4/22/19.
//  Copyright © 2019 Team Notify. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class NewBathroomViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseLabel.isHidden = true
        purchaseSwitch.isHidden = true
        purchaseSwitch.isOn = false
        reviewTextField.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var cameraView: UIImageView!
    
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var openingTimeField: UITextField!
    @IBOutlet weak var closingTimeField: UITextField!
    @IBOutlet weak var disabilitySelection: UISegmentedControl!
    @IBOutlet weak var publicPrivateSelection: UISegmentedControl!
    @IBOutlet weak var unisexSelection: UISegmentedControl!
    @IBOutlet weak var sizeSelection: UISegmentedControl!
    @IBOutlet weak var purchaseSwitch: UISwitch!
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet weak var reviewTextField: UITextView!
    
   
    
    @IBAction func onClickSubmit(_ sender: Any) {
        let bathroom = PFObject(className: "Bathrooms")
        bathroom["location"] = locationField.text!
        bathroom["author"] = PFUser.current()!
        let imageData = cameraView.image?.pngData()
        let file = PFFileObject(data:imageData!)
        bathroom["image"] = file
        bathroom["opening"] = openingTimeField.text!
        bathroom["closing"] = closingTimeField.text!
        bathroom["size"] = sizeSelection.titleForSegment(at: sizeSelection.selectedSegmentIndex)
        bathroom["unisex"] = unisexSelection.titleForSegment(at: unisexSelection.selectedSegmentIndex)
        bathroom["disability"] = disabilitySelection.titleForSegment(at: disabilitySelection.selectedSegmentIndex)
        bathroom["publicprivate"] = publicPrivateSelection.titleForSegment(at: publicPrivateSelection.selectedSegmentIndex)
        bathroom["purchase"] = purchaseSwitch.isOn
        bathroom["rating"] = current_rating
        bathroom.saveInBackground { (success, error) in
            if success{
                UserDefaults.standard.set(bathroom.objectId, forKey: "bathroomID")
                let review = PFObject(className: "Reviews")
                review["content"] = self.reviewTextField.text!
                review["bathroomID"] = bathroom.objectId
                review.saveInBackground()
                self.performSegue(withIdentifier: "createdBathroomSegue", sender: nil)
                print("saved")
            }else{
                self.dismiss(animated: true, completion: nil)
                print("error!")
            }
        }
    }
    
    
    @IBAction func onCameraClick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated:true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width:300, height:300)
        let scaledImage = image.af_imageScaled(to: size)
        cameraView.image = scaledImage
        dismiss(animated:true,completion:nil)
    }

   var current_rating = 1
    
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    
    @IBAction func onClickStar1(_ sender: Any) {
        star2.setImage(UIImage(named:"white_star"),for: .normal)
        star3.setImage(UIImage(named:"white_star"),for: .normal)
        star4.setImage(UIImage(named:"white_star"),for: .normal)
        star5.setImage(UIImage(named:"white_star"),for: .normal)
        current_rating = 1
    }
    
    @IBAction func onClickStar2(_ sender: Any) {
        star2.setImage(UIImage(named:"black_star"),for: .normal)
        star3.setImage(UIImage(named:"white_star"),for: .normal)
        star4.setImage(UIImage(named:"white_star"),for: .normal)
        star5.setImage(UIImage(named:"white_star"),for: .normal)
         current_rating = 2
    }
    
    @IBAction func onClickStar3(_ sender: Any) {
        star2.setImage(UIImage(named:"black_star"),for: .normal)
        star3.setImage(UIImage(named:"black_star"),for: .normal)
        star4.setImage(UIImage(named:"white_star"),for: .normal)
        star5.setImage(UIImage(named:"white_star"),for: .normal)
        current_rating = 3
    }
    
    @IBAction func onClickStar4(_ sender: Any) {
        star2.setImage(UIImage(named:"black_star"),for: .normal)
        star3.setImage(UIImage(named:"black_star"),for: .normal)
        star4.setImage(UIImage(named:"black_star"),for: .normal)
        star5.setImage(UIImage(named:"white_star"),for: .normal)
        current_rating = 4
    }
    
    @IBAction func onClickStar5(_ sender: Any) {
        star2.setImage(UIImage(named:"black_star"),for: .normal)
        star3.setImage(UIImage(named:"black_star"),for: .normal)
        star4.setImage(UIImage(named:"black_star"),for: .normal)
        star5.setImage(UIImage(named:"black_star"),for: .normal)
        current_rating = 5
    }
    
    
    @IBAction func onSwitchPublicPrivate(_ sender: Any) {
        if publicPrivateSelection.titleForSegment(at: publicPrivateSelection.selectedSegmentIndex) == "Private" {
            purchaseLabel.isHidden = false
            purchaseSwitch.isHidden = false
        } else {
            purchaseLabel.isHidden = true
            purchaseSwitch.isHidden = true
            purchaseSwitch.isOn = false
        }
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
