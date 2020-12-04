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
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SubjectCell", bundle: nil), forCellReuseIdentifier: "SubjectCell")
        tableView.register(UINib(nibName: "AddSubjectCell", bundle: nil), forCellReuseIdentifier: "AddSubjectCell")
    }
    
    private func setupUserImage() {
        userImageView.backgroundColor = .systemTeal
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.image = UIImage(systemName: "person")
    }
}

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Active Subjects:"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyClasses.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < dummyClasses.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
            cell.subjectLabel.text = dummyClasses[indexPath.row].name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddSubjectCell", for: indexPath) as! AddSubjectCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < dummyClasses.count {
            let vc = SubjectViewController()
            vc.subject = dummyClasses[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else {
            
        }
    }
}
