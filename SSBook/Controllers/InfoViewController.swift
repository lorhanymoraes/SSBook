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
    @IBOutlet var infoView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var detailsButton: UIButton!
    
    
    var infoPresenter = InfoViewPresenter()
    var infoBooks: FavoriteBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        lbTitle.text = infoBooks?.name
        lbAuthor.text = infoBooks?.author?.name
        tfOverview.text = infoBooks?.favoriteBookDescription
        setupImageCover(with: infoBooks)
        infoView.layer.cornerRadius = 20
    }
    
    func setupImageCover(with book: FavoriteBook?) {
        if let url = URL(string: book?.cover ?? " ") {
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
        guard let title = lbTitle.text else { return }
        guard let author = lbAuthor.text else { return }
        let cover = setupImageCover(with: infoBooks)
        let activityViewController = UIActivityViewController(activityItems: [title, author, cover], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
        
    }
    
}


   

extension InfoViewController: InfoViewPresenterDelegate {
    func reloadView() {
    }
    
    
}
