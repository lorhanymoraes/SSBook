//
//  InfoViewController.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import UIKit
import Kingfisher


class InfoViewController: UIViewController {
    
    
    
    @IBOutlet var isFavorite: UIButton!
    @IBOutlet weak var coverBookImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var tfOverview: UITextView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var detailsButton: UIButton!
    
    var infoBooks: FavoriteBook?
    var allBooks: AllBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        lbTitle.text = infoBooks?.name ?? allBooks?.name
        lbAuthor.text = infoBooks?.author?.name ?? allBooks?.author?.name
        tfOverview.text = infoBooks?.favoriteBookDescription ?? allBooks?.allBookDescription
        setupImageCover()
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 30
        infoView.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    func setupImageCover() {
        if let url = URL(string: (infoBooks?.cover ?? allBooks?.cover) ?? " ") {
            coverBookImage.kf.indicatorType = .activity
            coverBookImage.kf.setImage(with: url)
        } else {
            coverBookImage.image = nil
        }
    }
    
    func setupButtonFavorite() {
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

    

