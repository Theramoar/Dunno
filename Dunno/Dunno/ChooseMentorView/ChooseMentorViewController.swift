//
//  ChooseMentorViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit




class ChooseMentorViewController: UIViewController {
    var studentsMentors = [Student]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        navigationItem.title = "Choose Mentor"

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MentorCell")
    }
}


extension ChooseMentorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentsMentors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MentorCell", for: indexPath)
        cell.textLabel?.text = studentsMentors[indexPath.row].name
        return cell
    }
}
