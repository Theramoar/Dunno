//
//  ViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit



class SubjectListViewController: UIViewController {
    private let viewModel = ClassViewModel()
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ClassCell.self, forCellReuseIdentifier: "ClassCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension SubjectListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath) as! ClassCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? ClassCellViewModel
        return cell
    }
}
