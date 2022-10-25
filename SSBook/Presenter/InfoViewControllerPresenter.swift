//
//  InfoViewControllerPresenter.swift
//  SSBook
//
//  Created by Lorhany Moraes on 25/10/22.
//

import Foundation

protocol InfoViewControllerProtocol {
    func getOverviewBook()
}

class InfoViewControllerPresenter {
    var view: InfoViewControllerProtocol?
    
    init(with view: InfoViewControllerProtocol) {
        self.view = view
    }
    
    var overviewBook: FavoriteData?
    
    func getOverviewBook() {
        NetworkServices.shared.getFavoritesBooks { favorites in
            self.overviewBook = favorites
        } OnError: {
        }


    }
}
