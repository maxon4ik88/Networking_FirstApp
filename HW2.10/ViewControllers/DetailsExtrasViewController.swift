//
//  DetailsExtrasViewController.swift
//  HW2.10
//
//  Created by Maxon on 23.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class DetailsExtrasViewController: UIViewController {
    
    @IBOutlet var ipLabel: UILabel!
    @IBOutlet var dogScreenImageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var ipValue: ShowIP!
    var dogImage: RandomDog!
    var dogImageUrl: URL!
    
    var ipScreen: Bool!
    var dogScreen: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        ipLabel.isHidden = true
        dogScreenImageView.isHidden = true
        
        if ipScreen != nil && ipScreen == true {
            ipLabel.isHidden = false
        } else if ipScreen != nil && ipScreen == false {
            ipLabel.isHidden = true
        }
        
        if dogScreen != nil && dogScreen == true {
            dogScreenImageView.isHidden = false
        } else if dogScreen != nil && dogScreen == false {
            dogScreenImageView.isHidden = true
        }
    }

}
