//
//  InitialViewController.swift
//  SSBook
//
//  Created by Lorhany Moraes on 21/10/22.
//

import UIKit
import Kingfisher

class InitialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var initialViewPresenter = InitialViewPresenter()
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet var categorysbuttons: [UIButton]!
    @IBOutlet weak var collectionViewBooks: UICollectionView!
    @IBOutlet weak var collectionViewAuthors: UICollectionView!
    @IBOutlet weak var tableViewFavoritesAuthors: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupViews()
        initialViewPresenter.delegate = self
        initialViewPresenter.getBooks()
        initialViewPresenter.getAuthors()
        initialViewPresenter.getImageUser()
        initialViewPresenter.getAllBooks()
    }
    
    func setupViews() {
        tableViewFavoritesAuthors.delegate = self
        tableViewFavoritesAuthors.dataSource = self
        collectionViewBooks.delegate = self
        collectionViewBooks.dataSource = self
        collectionViewAuthors.delegate = self
        collectionViewAuthors.dataSource = self
        
        firstView.clipsToBounds = true
        
        firstView.layer.cornerRadius = 30
        firstView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        secondView.clipsToBounds = true
        secondView.layer.cornerRadius = 30
        secondView.layer.maskedCorners = [.layerMinXMinYCorner]
        
    }
    
    func setupImage() {
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.borderColor = UIColor.gray.cgColor
        userImage.layer.borderWidth = 1
        
        if let url = URL(string: initialViewPresenter.userImage?.data?.userPicture ?? " ") {
            userImage.kf.indicatorType = .activity
            userImage.kf.setImage(with: url)
        } else {
            userImage.image = nil
        }
        
    }
    
    func setupButtons() {
        categorysbuttons.forEach { button in
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 0.8
            button.layer.cornerRadius = button.frame.size.height/2
        }
        
    }
    
    func showMessage(type: ErrorResponse) {
        let title = type == .error ? "Aviso" : "Erro"
        let message = type == .error ? "Algo inesperado ocorreu" : "Não foi possível carregar os livros"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTableOverview" {
            guard let controller = segue.destination as? InfoViewController else {return}
            let showBooks = initialViewPresenter.allBooks?.data?.allBooks?[tableViewFavoritesAuthors.indexPathForSelectedRow?.row ?? 0]
            controller.infoBooks = showBooks
            controller.bookIsFavorite = false
            
        } else {
            guard let controller = segue.destination as? InfoViewController else {return}
            let showBooks = initialViewPresenter.booksInfos[collectionViewBooks.indexPathsForSelectedItems?.first!.row ?? 0]
            controller.infoBooks = showBooks
            controller.bookIsFavorite = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initialViewPresenter.numberOfRowsInSection(section)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initialViewPresenter.setupCell(tableView, indexPath)
    }
}

extension InitialViewController: InitialViewPresenterDelegate {
    func showAlert(type: ErrorResponse) {
        showMessage(type: type)
    }
    
    func loadUserImage() {
        setupImage()
    }
    
    func reloadTableViewBooks() {
        tableViewFavoritesAuthors.reloadData()
    }
    
    func reloadCollectionViews() {
        collectionViewBooks.reloadData()
        collectionViewAuthors.reloadData()
    }
}

extension InitialViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewBooks {
            return initialViewPresenter.numberOfRowsInSectionForCollectionBooks(section)
        } else {
            return  initialViewPresenter.numberOfRowsInSectionForCollectionAuthors(section)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewBooks {
            
            return initialViewPresenter.setupBooksCollectionCell(collectionView, indexPath: indexPath)
        } else {
            
            return initialViewPresenter.setupAuthorsCollectionCell(collectionView, indexPath: indexPath)
        }
    }
    
}






