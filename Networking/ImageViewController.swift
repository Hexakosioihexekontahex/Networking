//
//  ImageViewController.swift
//  Networking
//
//  Created by Roman Melnik on 28/02/2020.
//  Copyright © 2020 Roman Melnik. All rights reserved.
//

import UIKit
import Alamofire

class ImageViewController: UIViewController {
    private let url = "https://images.unsplash.com/photo-1538464721630-06563f546140?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
    
//    private let largeImageUrl = "https://i.imgur.com/3416rvI.jpg"
    private let largeImageUrl = "https://effigis.com/wp-content/uploads/2015/02/DigitalGlobe_WorldView1_50cm_8bit_BW_DRA_Bangkok_Thailand_2009JAN06_8bits_sub_r_1.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    func fetchImage() {

        NetworkManager.downloadImage(url: url) { image in
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
    
    func fetchDataWithAlamofire() {
        
        AlamofireNetworkRequest.downloadImage(url: url) { (image) in
            
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
    
    func fetchDataWithAlamofireAndProgress() {
        AlamofireNetworkRequest.onProgress = { progress in
            self.progress.isHidden = false
            self.progress.progress = Float(progress)
        }
        
        AlamofireNetworkRequest.completed = { completed in
            self.progressLabel.isHidden = false
            self.progressLabel.text = completed
        }
        
        AlamofireNetworkRequest.downloadImageWithProgress(url: largeImageUrl) { (image) in
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
            self.progressLabel.isHidden = true
            self.progress.isHidden = true
        }
        
    }
}
