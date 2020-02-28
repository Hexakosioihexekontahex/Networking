//
//  ViewController.swift
//  Networking
//
//  Created by Roman Melnik on 28/02/2020.
//  Copyright © 2020 Roman Melnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var getImageButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }


    @IBAction func getImagePressed(_ sender: Any) {
        label.isHidden = true
        getImageButton.isEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let url = URL(string: "https://images.unsplash.com/photo-1538464721630-06563f546140?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max") else {
            activityIndicator.isHidden = true
            label.text = "Error's recieved"
            label.isHidden = false
            return }
        
        URLSession.shared/* Singleton session */
            .dataTask(with: url) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.imageView.image = image
                    }
                }
        }.resume()
    }
    
}

