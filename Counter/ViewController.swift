//
//  ViewController.swift
//  Counter
//
//  Created by Thai, Kristina on 9/18/16.
//
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.title = "Counter"
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }
}

extension ViewController: UITableViewDelegate {
  //Implement UITableViewDelegate functions here
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0;
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
