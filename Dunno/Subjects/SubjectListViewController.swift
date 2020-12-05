//
//  ViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit



class SubjectListViewController: UIViewController {
    private let viewModel = ClassViewModel()
    var subjects = dummySubjects
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SubjectCell", bundle: nil), forCellReuseIdentifier: "SubjectCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
    }
}


extension SubjectListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? SubjectCellViewModel
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SubjectTopicsViewController()
        vc.subject = subjects[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
