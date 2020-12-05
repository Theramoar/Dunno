//
//  SubjectTopicsViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

class SubjectTopicsViewController: UIViewController {
    
    var subject: Subject!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        navigationItem.title = subject.name
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TopicCell")
    }
}

extension SubjectTopicsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subject.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath)
        cell.textLabel?.text = subject.topics[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TopicViewController()
        vc.topic = subject.topics[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
