//
//  InfoViewController.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import UIKit
import Kingfisher

class InfoViewController: UIViewController {

    @IBOutlet weak var coverBookImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var tfOverview: UITextView!
    
    var infoPresenter: InfoViewControllerPresenter?
    var infoBooks: FavoriteBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoPresenter?.getOverviewBook()
    }
    
    func setupView(with overview: FavoriteBook) {
        lbTitle.text = overview.name
        lbAuthor.text = overview.author?.name
        tfOverview.text = overview.favoriteBookDescription
        setupImageCover(with: overview)
    }
    
    func setupImageCover(with book: FavoriteBook) {
        if let url = URL(string: book.cover ?? " ") {
            coverBookImage.kf.indicatorType = .activity
            coverBookImage.kf.setImage(with: url)
        } else {
            coverBookImage.image = nil
        }
    
    }

}

extension InfoViewController: InfoViewControllerProtocol {
    func getOverviewBook() {
        
    }
    
}
