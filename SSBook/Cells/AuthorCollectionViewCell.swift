//
//  AuthorCollectionViewCell.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import UIKit

class AuthorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorTitle: UILabel!
    @IBOutlet weak var authorBooks: UILabel!
    
    func prepareaAuthorCell(with author: FavoriteAuthor) {
        authorTitle.text = author.name
        let intCountBooks : String = String(author.booksCount ?? 0)
        authorBooks.text = intCountBooks
        setupImage(with: author)
    }
    
    
    func setupImage(with author: FavoriteAuthor) {
        authorImage.layer.cornerRadius = 20
        if let url = URL(string: author.picture ?? " ") {
            authorImage.kf.indicatorType = .activity
            authorImage.kf.setImage(with: url)
        } else {
            authorImage.image = nil
        }
    
    }
}
