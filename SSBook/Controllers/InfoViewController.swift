//
//  InfoViewController.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import UIKit
import Kingfisher


class InfoViewController: UIViewController {
    
    
    
    @IBOutlet weak var btIsFavorite: UIButton!
    @IBOutlet weak var coverBookImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var tfOverview: UITextView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var detailsButton: UIButton!
    
    var infoBooks: Book?
    var bookIsFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        lbTitle.text = infoBooks?.name
        lbAuthor.text = infoBooks?.author?.name
        tfOverview.text = infoBooks?.favoriteBookDescription
        setupImageCover()
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 30
        infoView.layer.maskedCorners = [.layerMinXMinYCorner]
        btIsFavorite.setImage(bookIsFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
    }
    
    func setupImageCover() {
        if let url = URL(string: (infoBooks?.cover) ?? " ") {
            coverBookImage.kf.indicatorType = .activity
            coverBookImage.kf.setImage(with: url)
        } else {
            coverBookImage.image = nil
        }
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedDetailsButton(_ sender: UIButton) {
        guard let title = lbTitle.text, let author = lbAuthor.text else { return }
        let activityViewController = UIActivityViewController(activityItems: [title, author], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
        
    }
    
}

    

