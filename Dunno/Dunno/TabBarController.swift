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
        let messages = coreData.loadDataFromContainer(ofType: SavedMessage.self)
        userData.messages = messages
        viewControllers = [createVC(vc: ClassViewController(), image: UIImage(systemName: "books.vertical"), title: "Subjects"),
                           createVC(vc: ChatViewController(), image: UIImage(systemName: "message"), title: "Chats"),
                           createVC(vc: UserProfileViewController(), image: UIImage(systemName: "person"), title: "User profile")]
    }
    
    
        
    private func createVC(vc: UIViewController, image: UIImage?, title: String) -> UIViewController {
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.title = title
        vc.navigationItem.title = title
        navVC.navigationBar.prefersLargeTitles = true
        return navVC
    }
    
    
//    func createMockData() {
//        _ = CoreDataManager.shared.saveMessage(direction: .outbound, message: "MockedMessage 1", colocutor: "Slavik", date: Date())
//        _ = CoreDataManager.shared.saveMessage(direction: .inbound, message: "MockedMessage 2", colocutor: "Slavik", date: Date())
//        _ = CoreDataManager.shared.saveMessage(direction: .outbound, message: "MockedMessage 3", colocutor: "Slavik", date: Date())
//    }
}
