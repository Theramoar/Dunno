//
//  TabbarController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit



class TabBarController: UITabBarController {
    private let userData: UserData = .shared
    private let coreData: CoreDataManager = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createMockData()
        let messages = coreData.loadDataFromContainer(ofType: SavedMessage.self)
        userData.messages = messages
        viewControllers = [createVC(vc: SubjectListViewController(), image: UIImage(systemName: "books.vertical"), title: "Subjects"),
                           createVC(vc: ChatListViewController(), image: UIImage(systemName: "message"), title: "Chats"),
                           createVC(vc: UserProfileViewController(), image: UIImage(systemName: "person"), title: "User profile")]
    }
    
    
        
    private func createVC(vc: UIViewController, image: UIImage?, title: String) -> UIViewController {
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.title = title
        
        vc.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        vc.navigationController?.navigationBar.backgroundColor = .white
        vc.navigationController?.navigationBar.tintColor = .black
        vc.navigationItem.title = title
        navVC.navigationBar.prefersLargeTitles = true
        
        let logo = UIImage(named: "LogoCut")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        vc.navigationItem.titleView = imageView
        
        return navVC
    }
    

    private func createMockData() {
        _ = CoreDataManager.shared.saveMessage(direction: .outbound, message: "Hello", colocutor: "Slavik", date: Date())
        _ = CoreDataManager.shared.saveMessage(direction: .inbound, message: "Hello", colocutor: "Slavik", date: Date())
        _ = CoreDataManager.shared.saveMessage(direction: .outbound, message: "Will you teach me, Mentor?", colocutor: "Slavik", date: Date())
    }
}
