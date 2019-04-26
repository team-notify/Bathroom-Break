//
//  ReviewsViewController.swift
//  Bathroom Break
//
//  Created by Christopher Dabalsa on 4/24/19.
//  Copyright © 2019 Team Notify. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class ReviewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var bathroomName: UILabel!
    
    @IBOutlet weak var bathroomRatingLabel: UILabel!
    @IBOutlet weak var bathroomImage: UIImageView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "Bathrooms")
        let newID = UserDefaults.standard.string(forKey: "bathroomID")
        query.getObjectInBackground(withId: newID!) { (bathroom: PFObject?, error: Error?) in
            if let error = error {
                //The query returned an error
                print(error.localizedDescription)
            } else {
                //The object has been retrieved
                self.bathroomName.text = bathroom!["location"] as! String
                self.bathroomRatingLabel.text = String(bathroom!["rating"] as! Int)
                let imageFile = bathroom!["image"] as! PFFileObject
                let urlString = imageFile.url!
                let url = URL(string: urlString)!
                self.bathroomImage.af_setImage(withURL: url)
                let reviewQuery = PFQuery(className: "Reviews")
                print(bathroom?.objectId)
                reviewQuery.whereKey("bathroomID", equalTo: bathroom?.objectId)
                reviewQuery.findObjectsInBackground{(reviews:[PFObject]?, error) in
                    let reviews = reviews
                    print(reviews)
                }
            }
        }

        // Do any additional setup after loading the view.
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
