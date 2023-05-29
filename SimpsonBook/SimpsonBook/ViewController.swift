//
//  ViewController.swift
//  SimpsonBook
//
//  Created by ILKER on 29.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mySimpson = [Simpson]()
    
    var chosenSimpsen : Simpson?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Simpson Objects
        
        let homer = Simpson(name: "Homer Simpson", job: "Nuclear Safety", image: UIImage(named: "Homer")!)
        let marge = Simpson(name: "Marge Simpson", job: "House Wife", image: UIImage(named: "Marge")!)
        let bart = Simpson(name: "Bart Simpson", job: "Student", image: UIImage(named: "Bart")!)
        let lisa = Simpson(name: "Lisa Simpson", job: "Student", image: UIImage(named: "Lisa")!)
        
        mySimpson.append(homer)
        mySimpson.append(marge)
        mySimpson.append(bart)
        mySimpson.append(lisa)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = mySimpson[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpsen = mySimpson[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpsen
        }
    }
}

