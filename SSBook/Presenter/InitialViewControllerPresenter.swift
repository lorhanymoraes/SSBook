//
//  InitialViewControllerPresenter.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import Foundation
import UIKit

protocol InitialViewControllerProtocol {
    func getbooks()
    func getAuthors()
}

class InitialViewControllerPresenter {
    var view: InitialViewControllerProtocol?
    
    init(with view: InitialViewControllerProtocol) {
        self.view = view
    }
    
    var booksInfos: [FavoriteBook] = []
    
    var favBooks: FavoriteData?
    var favAuthors: AuthorData?
    var tableView = UITableView()
    var collectionViews = UICollectionView()
    
    func getBooks() {
        NetworkServices.shared.getFavoritesBooks{ favorites in
            self.favBooks = favorites
            self.tableView.reloadData()
            self.collectionViews.reloadData()
        } OnError: {
        }
    }
    
    func getAuthors() {
        NetworkServicesAuthor.shared.getFavoritesAuthors { authors in
            self.favAuthors = authors
            } OnError: {
        }

    }
    
}
   
