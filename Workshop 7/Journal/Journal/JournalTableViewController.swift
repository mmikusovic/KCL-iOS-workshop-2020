//
//  JournalTableViewController.swift
//  Journal
//
//  Created by Martin Mikusovic on 05/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    private var entries = [JournalEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(named: "Fuchsia")
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func addEntry(_ sender: Any) {
        let nc = storyboard?.instantiateViewController(withIdentifier: "NewEntryNC") as! UINavigationController
        let vc = nc.topViewController as! NewEntryViewController
        vc.delegate = self
        present(nc, animated: true, completion: nil)
    }
}

// MARK: - Table view data source
extension JournalTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath)
        cell.textLabel?.text = entries[indexPath.row].text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "JournalDetailViewController") as! JournalDetailViewController
        vc.entry = entries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - NewEntryDelegate
extension JournalTableViewController: NewEntryDelegate {
    
    func add(entry: JournalEntry) {
        entries.append(entry)
        tableView.reloadData()
    }
}
