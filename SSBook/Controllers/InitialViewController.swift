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
    

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var categorysbuttons: [UIButton]!
    @IBOutlet weak var collectionViewBooks: UICollectionView!
    @IBOutlet weak var collectionViewAuthors: UICollectionView!
    @IBOutlet weak var tableViewFavoritesAuthors: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
        setupButtons()
        setupViews()
        initialViewPresenter.getBooks()
        initialViewPresenter.getAuthors()
    }
    
    func setupViews() {
        tableViewFavoritesAuthors.delegate = self
        tableViewFavoritesAuthors.dataSource = self
        collectionViewBooks.delegate = self
        collectionViewBooks.dataSource = self
        collectionViewAuthors.delegate = self
        collectionViewAuthors.dataSource = self
    }
    
    func setupImage() {
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.borderColor = UIColor.gray.cgColor
        userImage.layer.borderWidth = 1
        
        if let url = URL(string: "https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg") {
            userImage.kf.indicatorType = .activity
            userImage.kf.setImage(with: url)
        } else {
            userImage.image = nil
        }
    }
    
    func setupButtons() {
        categorysbuttons.forEach { button in
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = button.frame.size.height/4
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? InfoViewController else {return}
        let showBooks = initialViewPresenter.booksInfos[collectionViewBooks.indexPathsForSelectedItems?.first!.row ?? 0]
        controller.infoBooks = showBooks
    }
    
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initialViewPresenter.numberOfRowsInSection(section)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initialViewPresenter.setupCell(tableView, indexPath)
    }
}

extension InitialViewController: InitialViewPresenterDelegate {
    
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






