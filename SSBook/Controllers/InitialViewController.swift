//
//  InitialViewController.swift
//  SSBook
//
//  Created by Lorhany Moraes on 21/10/22.
//

import UIKit


class InitialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var initialPresenter: InitialViewControllerPresenter?
    var booksInfos: [FavoriteBook] = []
    var allBooks: [FavoriteBook]?
    var favAuthors: [FavoriteAuthor] = []
    let tableView = UITableView()
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet var categorysbuttons: [UIButton]!
    
    @IBOutlet weak var collectionViewBooks: UICollectionView!
    @IBOutlet weak var collectionViewAuthors: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
        setupButtons()
        initialPresenter?.getBooks()
        initialPresenter?.getAuthors()
        collectionViewBooks.reloadData()
        collectionViewAuthors.reloadData()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupImage() {
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.layer.borderColor = UIColor.gray.cgColor
        userImage.layer.borderWidth = 1
    }
    
    func setupButtons() {
        categorysbuttons.forEach { button in
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = button.frame.size.height/4
        }
        
    }
    
    
    private func setupCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table cell", for: indexPath) as? LibraryTableViewCell, let favoriteBook = (allBooks?[indexPath.row]) else { return UITableViewCell() }
        cell.prepareCell(with: favoriteBook)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksInfos.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        setupCell(indexPath)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(velocity.y>0) {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.tabBarController?.tabBar.isHidden = true
                print("Hide")
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.tabBarController?.tabBar.isHidden = false
                print("Unhide")
            }, completion: nil)
        }
    }
    
}

extension InitialViewController: InitialViewControllerProtocol {
    func getAuthors() {
    }
    func getbooks() {
    }
}


extension InitialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewBooks {
            return booksInfos.count
        } else {
            return  favAuthors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewBooks {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection book cell", for: indexPath) as! BookCollectionViewCell
            
            let favoriteBook = (booksInfos[indexPath.row])
            
            cell.prepareCell(with: favoriteBook)
            
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "author collection cell", for: indexPath) as! AuthorCollectionViewCell
            let favoriteAuthors = favAuthors[indexPath.row]
            cell.prepareaAuthorCell(with: favoriteAuthors)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueInfo", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueInfo" {
            let indexPath: IndexPath = sender as! IndexPath
            let viewControllerDestination = segue.destination as! InfoViewController
            let books = booksInfos[indexPath.row]
            viewControllerDestination.infoBooks = books
            navigationController?.pushViewController(viewControllerDestination, animated: true)
            
        }
    }
}






