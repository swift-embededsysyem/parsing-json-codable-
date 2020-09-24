//
//  ViewController.swift
//  employeeApp1
//
//  Created by akbar  Rizvi on 4/2/20.
//  Copyright © 2020 akbar  Rizvi. All rights reserved.
//

import UIKit

class HeadlLinesTableViewController: UITableViewController {
    
    typealias ArrayIgnoringFailure<Value: Decodable> = IgnoreFailure<Value>
    var elements = [HiringElement] ()
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        let urlString =  "https://fetch-hiring.s3.amazonaws.com/hiring.json"
        guard let url = URL(string: urlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            //Decode data
            
            
            
            guard let objects =  try? JSONDecoder().decode(ArrayIgnoringFailure<HiringElement>.self, from: data)  else { return }
            self.elements = objects.wrappedValue
            
            
            print(data)
            
            
            //Get back to the main queue
            DispatchQueue.main.async  {
                self.tableView.reloadData()
            }
            
        }.resume() 
        
    }
    
    
    
    
    
    // MARK: - Table view functions
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return elements.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            as? HeadlinesCell else {
                fatalError(" cell not found ")  }
        
        
        cell.nameLabel.text = elements[indexPath.row].name
        let value1 = "\(elements[indexPath.row].id)"
        cell.idLabel.text =  value1
        let value2 = "\(elements[indexPath.row].listId)"
        cell.userIdLabel.text = value2
        
        
        
        return cell
    }
    
}


