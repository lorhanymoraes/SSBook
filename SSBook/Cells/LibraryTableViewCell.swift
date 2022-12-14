//
//  LibraryTableViewCell.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import UIKit
import Kingfisher

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareCell(with book: Book) {
        bookTitle.text = book.name
        authorName.text = book.author?.name
        setupImageCover(with: book)
    }
    
    func setupImageCover(with book: Book) {
        bookImage.layer.cornerRadius = 10
        if let url = URL(string: book.cover ?? " ") {
            bookImage.kf.indicatorType = .activity
            bookImage.kf.setImage(with: url)
        } else {
            bookImage.image = nil
        }
    }
}
