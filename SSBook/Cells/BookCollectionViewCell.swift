//
//  BookCollectionViewCell.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
 
    func prepareCell(with book: FavoriteBook) {
        bookTitle.text = book.name
        authorName.text = book.author?.name
        setupImageCover(with: book)
    }
    
    func setupImageCover(with book: FavoriteBook) {
        coverImage.layer.cornerRadius = 10
        if let url = URL(string: book.cover ?? " ") {
            coverImage.kf.indicatorType = .activity
            coverImage.kf.setImage(with: url)
        } else {
            coverImage.image = nil
        }
    
    }
}
