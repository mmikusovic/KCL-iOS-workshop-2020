//
//  ViewController.swift
//  FireToDo
//
//  Created by Martin Mikusovic on 12/01/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit
import FirebaseFirestore

class TaskTVC: UITableViewController {
    
    private var tasks = [Task]()
    private var listener: ListenerRegistration?
    
    private var query: Query? {
       didSet {
           if let listener = listener {
               listener.remove()
           }
       }
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        query = Firestore.firestore().collection("Tasks")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.listener = query?.addSnapshotListener { (documents, error) in
            guard let snapshot = documents else {
                print("Error fetching documents results: \(error!)")
                return
            }
            
            let results = snapshot.documents.map { (document) -> Task in
                if let task = Task(dictionary: document.data(), id: document.documentID) {
                    return task
                } else {
                    fatalError("Unable to initialize type \(Task.self) with dictionary \(document.data())")
                }
            }
            
            self.tasks = results
            self.tableView.reloadData()
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.listener?.remove()
    }
}

extension TaskTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let item = tasks[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = tasks[indexPath.row]
            _ = Firestore.firestore().collection("Tasks").document(item.id).delete()
        }
    }
}

extension TaskTVC {
    
    @IBAction func addTask(_ sender: Any) {
        let alertVC = UIAlertController(title: "New Task", message: "What do you want to remember?", preferredStyle: .alert)
        alertVC.addTextField { (textField) in }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) -> Void in
            if let textField = alertVC.textFields?.first {
                let db = Firestore.firestore()
                var docRef: DocumentReference? = nil
                docRef = db.collection("Tasks").addDocument(data: [
                    "name": textField.text ?? "empty task"
                ]) { error in
                    if let err = error {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(docRef!.documentID)")
                    }
                }
            }
        }
        alertVC.addAction(addAction)
        present(alertVC, animated: true, completion: nil)
    }
}
