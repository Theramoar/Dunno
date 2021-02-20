//
//  ChooseMentorViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

//class ChooseMentorViewController: UIViewController {
//    var studentsMentors = [Mentor]()
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var takeTestButton: UIButton!
//    
//    override func viewDidLoad() {
//        navigationItem.title = "Choose Mentor"
//        setupAppearance(for: takeTestButton)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MentorCell")
//    }
//    
//    private func setupAppearance(for button: UIButton) {
//        button.layer.cornerRadius = 10
//        button.layer.shadowOffset = CGSize(width: 0, height: 2)
//        button.layer.shadowOpacity = 0.3
//        button.layer.shadowRadius = 4
//    }
//    
//    func presentMentorChosenAlert() {
//        let alert = UIAlertController(title: "You have chosen a mentor!", message: "Mentor was added to your chats.\nThis topic was added to your profile.", preferredStyle: .alert)
//        let back = UIAlertAction(title: "Go back", style: .default) { [weak self] _ in
//            self?.navigationController?.popToRootViewController(animated: true)
//        }
//        alert.addAction(back)
//        present(alert, animated: true)
//    }
//    
//    @IBAction func takeTestButtonPressed(_ sender: Any) {
//        let vc = TestViewController()
//        present(vc, animated: true)
//    }
//}


//extension ChooseMentorViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        studentsMentors.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MentorCell", for: indexPath)
//        cell.textLabel?.text = studentsMentors[indexPath.row].student.name
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let chosenMentor = studentsMentors[indexPath.row]
//        UserData.shared.userStudent.mentors.append(chosenMentor)
//        presentMentorChosenAlert()
//    }
//}
