//
//  ViewController.swift
//  GitHubRepo
//
//  Created by Пользователь on 23.05.2018.
//  Copyright © 2018 Abramenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repo = [DataRepo]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! CellTableViewCell
        
        cell.idLabel?.text = String(repo[indexPath.row].id)
        cell.nameLabel?.text = repo[indexPath.row].name
        cell.ownerLoginLabel?.text = repo[indexPath.row].owner.login
        cell.descriptionTextField.text = repo[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RepoViewController {
            destination.myUrl = repo[(tableView.indexPathForSelectedRow?.row)!].html_url
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            print("Succesfiul")
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func downloadJSON(completed: @escaping () -> ()){
        let url = URL(string: "https://api.github.com/repositories")
        URLSession.shared.dataTask(with: url!) {(data, respones, error) in
            if error == nil {
                do {
                self.repo = try JSONDecoder().decode([DataRepo].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON ERROR")
                }
            }
        }.resume()
        
    }

}

