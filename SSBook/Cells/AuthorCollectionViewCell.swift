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
    
    func prepareaAuthorCell(with author: FavoriteAuthor?) {
        guard let author = author else {return}
        authorTitle.text = author.name
        let intCountBooks : String = String(author.booksCount ?? 0)
        authorBooks.text = intCountBooks + (" livros")
        setupImage(with: author)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.8
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    
    func setupImage(with author: FavoriteAuthor) {
        authorImage.layer.cornerRadius = 10
        if let url = URL(string: author.picture ?? " ") {
            authorImage.kf.indicatorType = .activity
            authorImage.kf.setImage(with: url)
        } else {
            authorImage.image = nil
        }
    
    }
}
