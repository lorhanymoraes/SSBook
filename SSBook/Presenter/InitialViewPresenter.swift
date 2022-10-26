//
//  InitialViewControllerPresenter.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import Foundation
import UIKit

protocol InitialViewPresenterDelegate {
    func reloadTableViewBooks()
    func reloadCollectionViews()
}

class InitialViewPresenter {
    
    var delegate: InitialViewPresenterDelegate?
    
    var booksInfos: [FavoriteBook] = []
    var favAuthors: AuthorDataResponse?
    
    func getBooks() {
        NetworkServices.shared.getFavoritesBooks{ favorites in
            self.booksInfos = favorites.data?.favoriteBooks ?? []
            self.delegate?.reloadCollectionViews()
            self.delegate?.reloadTableViewBooks()
        } OnError: { error in
            switch error {
            case .invalidJSON:
                print("JSON error")
            case .noData:
                print("Data error")
            case .noResponse:
                print("Response error")
            }
        }
    }
    
    func getAuthors() {
        NetworkServicesAuthor.shared.getFavoritesAuthors { authors in
            self.favAuthors = authors
            self.delegate?.reloadTableViewBooks()
            self.delegate?.reloadCollectionViews()
        } OnError: { error in
            switch error {
            case .invalidJSON:
                print("JSON error")
            case .noData:
                print("Data error")
            case .noResponse:
                print("Response error")
            }
        }
        
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return booksInfos.count
    }
    
    func setupCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table cell", for: indexPath) as? LibraryTableViewCell else { return UITableViewCell() }
        let favoritesBooks = booksInfos[indexPath.row]
        cell.prepareCell(with: favoritesBooks)
        return cell
    }
    
    func numberOfRowsInSectionForCollectionBooks(_ section: Int) -> Int {
        return booksInfos.count
    }
    
    func setupBooksCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection book cell", for: indexPath) as? BookCollectionViewCell else {return .init()}
        let favoriteBook = (booksInfos[indexPath.row])
        cell.prepareCell(with: favoriteBook)
        
        return cell
    }
    
    func setupAuthorsCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "author collection cell", for: indexPath) as? AuthorCollectionViewCell else {return .init()}
        let favoriteAuthors = favAuthors?.data?.favoriteAuthors?[indexPath.row] ?? nil
        cell.prepareaAuthorCell(with: favoriteAuthors)
        return cell
    }
    
    func numberOfRowsInSectionForCollectionAuthors(_ section: Int) -> Int {
        return favAuthors?.data?.favoriteAuthors?.count ?? 0
    }
    
    
}

