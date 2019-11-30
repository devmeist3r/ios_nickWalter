//
//  ViewProgressUpdateViewController.swift
//  Progress Jornal
//
//  Created by Lucas Inocencio on 30/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewProgressUpdateViewController: UIViewController {
    
    var progressUpdate: ProgressUpdate?
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = progressUpdate?.title
        if let imageData = progressUpdate?.image {
            photoImageView.image = UIImage(data: imageData)
        }
    }
    
}
