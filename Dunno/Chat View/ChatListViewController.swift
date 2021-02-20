//
//  ChatListViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

//class ChatListViewController: UIViewController {
//    var mentors: [Mentor] {
//        []
////        UserData.shared.userStudent.mentors
//    }
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ChatCell")
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
//}

//extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mentors.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath)
//        cell.textLabel?.text = mentors[indexPath.row].student.name
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = ChatViewController()
//        vc.mentor = mentors[indexPath.row]
//        let navVC = UINavigationController(rootViewController: vc)
//        present(navVC, animated: true)
//    }
//}
