//
//  TabbarController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit

let appColor = UIColor(named: "AppColor")

class TabBarController: UITabBarController {
    private let userData: UserData = .shared
    private let coreData: CoreDataManager = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = appColor
        tabBar.isTranslucent = false
        tabBar.isOpaque = false
        
        
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .white
        tabBar.barTintColor = appColor
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()

        let messages = coreData.loadDataFromContainer(ofType: SavedMessage.self)
        userData.messages = messages
        viewControllers = [createVC(vc: SubjectListViewController(), image: UIImage(systemName: "books.vertical"), title: "Active tests"),
                           createVC(vc: ChatListViewController(), image: UIImage(systemName: "message"), title: "Chats"),
                           createVC(vc: UserProfileViewController(), image: UIImage(systemName: "person"), title: "User profile")]
    }
    
    
        
    private func createVC(vc: UIViewController, image: UIImage?, title: String) -> UIViewController {
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.title = title
        vc.setAppNavigationBar(title: title)
        return navVC
    }
    

    private func createMockData() {
        _ = CoreDataManager.shared.saveMessage(direction: .outbound, message: "Hello", colocutor: "Slavik", date: Date())
        _ = CoreDataManager.shared.saveMessage(direction: .inbound, message: "Hello", colocutor: "Slavik", date: Date())
        _ = CoreDataManager.shared.saveMessage(direction: .outbound, message: "Will you teach me, Mentor?", colocutor: "Slavik", date: Date())
    }
}

extension UIViewController {
    func setAppNavigationBar(title: String) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = appColor
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "SmallLogo"), style: .plain, target: nil, action: nil)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:appColor!,
                              NSAttributedString.Key.font:UIFont(name: "PTMono-Regular", size: UIFont.labelFontSize)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = title
    }
}

