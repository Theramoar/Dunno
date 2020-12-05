//
//  UserProfileViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit



class UserProfileViewController: UIViewController {
    
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var userLevelLabel: UILabel!
    @IBOutlet private var levelProgressView: UIProgressView!
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        userNameLabel.text = "Ivan Ivanov"
        setupUserImage()
        setupTable()
        
        userNameLabel.text = UserData.shared.userStudent.name
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TopicCell", bundle: nil), forCellReuseIdentifier: "TopicCell")
        tableView.register(UINib(nibName: "AddSubjectCell", bundle: nil), forCellReuseIdentifier: "AddSubjectCell")
    }
    
    private func setupUserImage() {
        userImageView.backgroundColor = .lightGray
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.image = UIImage(named: "LogoCleanSmall")
//        (systemName: "person")
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserData.shared.authToken.removeAll()
        if presentingViewController == nil {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    

}

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Active Topics:"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.frame = CGRect(x: 8, y: 0, width: UIScreen.main.bounds.size.width, height: 30)
        label.text = "Active Topics:"
        view.addSubview(label)
        return view
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserData.shared.userStudent.mentors.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < UserData.shared.userStudent.mentors.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell
            cell.subjectLabel.text = UserData.shared.userStudent.mentors[indexPath.row].topic.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddSubjectCell", for: indexPath) as! AddSubjectCell
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < dummyTopics.count {
            let vc = TopicViewController()
            vc.topic = UserData.shared.userStudent.mentors[indexPath.row].topic
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension UserProfileViewController: AddButtonDelegate {
    func openSubjectList() {
        tabBarController?.selectedIndex = 0
    }
}
