//
//  Coordinator.swift
//  InterChallenge
//
//  Created by Mayara Mendonça de Souza on 24/10/21.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    func start()

}

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        
        let viewController = ChallengeViewController()
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
    func goToAlbums(with userId: Int, by name: String) {
        let albumTableViewController = AlbumTableViewController()
        albumTableViewController.coordinator = self
        albumTableViewController.userId = userId
        albumTableViewController.userName = name
        self.navigationController.pushViewController(albumTableViewController, animated: true)
    }
    
    func goToPosts(with userId: Int, by name: String) {
        let postTableViewController = PostTableViewController()
        postTableViewController.coordinator = self
        postTableViewController.userId = userId
        postTableViewController.userName = name
        self.navigationController.pushViewController(postTableViewController, animated: true)
    }
    
    func goToComments(with postId: Int, by userName: String) {
        let commentTableViewController = CommentTableViewController()
        commentTableViewController.coordinator = self
        commentTableViewController.userName = userName
        commentTableViewController.postId = postId
        self.navigationController.pushViewController(commentTableViewController, animated: true)
    }
    
    func goToPhotos(with albumId: Int, by userName: String) {
        let photoTableViewController = PhotoTableViewController()
        photoTableViewController.coordinator = self
        photoTableViewController.userName = userName
        photoTableViewController.albumId = albumId
        self.navigationController.pushViewController(photoTableViewController, animated: true)
    }
    
}
