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
    func loadUserImage()
}

class InitialViewPresenter {
    
    var delegate: InitialViewPresenterDelegate?
    var booksInfos: [FavoriteBook] = []
    var favAuthors: AuthorDataResponse?
    var userImage: UserImageResponse?
    var allBooks: AllBooksResponse?
    
    func getBooks() {
        NetworkServices.shared.getFavoritesBooks{ favorites in
            self.booksInfos = favorites.data?.favoriteBooks ?? []
            self.delegate?.reloadCollectionViews()
        } OnError: { error in
            switch error {
            case .error:
                showMessage(type: .error)
            }
        }
    }
    
    func getAuthors() {
        NetworkServices.shared.getFavoritesAuthors { authors in
            self.favAuthors = authors
            self.delegate?.reloadTableViewBooks()
        } OnError: { error in
            switch error {
            case .error:
                showMessage(type: .error)
            }
        }
        
    }
    
    func getAllBooks() {
        NetworkServices.shared.getAllBooks { books in
            self.allBooks = books
            self.delegate?.reloadTableViewBooks()
        } OnError: { error in
            switch error {
            case .error:
                showMessage(type: .error)
            }
        }
        
    }
    
    func getImageUser() {
        NetworkServices.shared.getUserImage { image in
            self.userImage = image
            self.delegate?.loadUserImage()
        } OnError: { error in
            switch error {
            case .error:
                showMessage(type: .error)
            }
        }
        
    }
    
    func showMessage(type: ErrorResponse) {
        let title = type == .error ? "Aviso" : "Erro"
        let message = type == .error ? "Algo inesperado ocorreu" : "Não foi possível carregar os livros"
        
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
         alert.addAction(cancelAction)
        
        }
   

    func numberOfRowsInSection(_ section: Int) -> Int {
        return allBooks?.data?.allBooks?.count ?? 0
    }
    
    func setupCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table cell", for: indexPath) as? LibraryTableViewCell else { return UITableViewCell() }
        guard let allBooks = (allBooks?.data?.allBooks?[indexPath.row]) else { return .init() }
        cell.prepareCell(with: allBooks)
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

