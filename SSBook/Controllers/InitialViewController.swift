//
//  InitialViewController.swift
//  SSBook
//
//  Created by Lorhany Moraes on 21/10/22.
//

import UIKit
import Kingfisher

class InitialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var initialViewPresenter = InitialViewPresenter()
    
    
    @IBOutlet var secondView: UIView!
    @IBOutlet var firstView: UIView!
    @IBOutlet var userImage: UIImageView!
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
        initialViewPresenter.showMessage(type: .error)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTableOverview" {
            guard let controller = segue.destination as? InfoViewController else {return}
            let showBooks = initialViewPresenter.allBooks?.data?.allBooks?[tableViewFavoritesAuthors.indexPathForSelectedRow?.row ?? 0]
            controller.allBooks = showBooks
        } else {
            guard let controller = segue.destination as? InfoViewController else {return}
            let showBooks = initialViewPresenter.booksInfos[collectionViewBooks.indexPathsForSelectedItems?.first!.row ?? 0]
            controller.infoBooks = showBooks
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






