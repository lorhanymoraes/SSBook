//
//  InitialViewController.swift
//  SSBook
//
//  Created by Lorhany Moraes on 21/10/22.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet var categorysbuttons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
        setupButtons()
    }
    

    func setupImage() {
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.borderColor = UIColor.gray.cgColor
        userImage.layer.borderWidth = 1
    }
    
    func setupButtons() {
        categorysbuttons.forEach { button in
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = button.frame.size.height/4
        }
        
    }
    

}
