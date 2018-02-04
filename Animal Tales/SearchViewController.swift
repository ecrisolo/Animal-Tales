//
//  SearchViewController.swift
//  Animal Tales
//
//  Created by Anita Souv on 2/3/18.
//  Copyright © 2018 Elizabeth Crisologo. All rights reserved.
//

import UIKit
import os


class SearchViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tales.count;
    }
    
    var tales = [TalesData]();
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellreuseId = "Tale"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:TaleTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellreuseId) as! TaleTableViewCell
            
  
        let img = UIImage(named: tales[indexPath.row].picture);
        print (tales[indexPath.row].picture);
        cell.pictureImageView = UIImageView(image: img)
        cell.titleLabel.text = tales[indexPath.row].title;
    
        return cell
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userName == "" {
            welcomeLabel.text = "Welcome!"
        } else {
            welcomeLabel.text = "Hello, " + userName
        }
        
        
        if let savedTales = loadTales() {
            tales += savedTales
        }
        else {
            // Load the sample data.
            loadSampleTales()
        }
        
        // Do any additional setup after loading the view.
    }

    var userName: String = "Welcome!"
    
    private func loadSampleTales() {
        var currentTales = [TalesData]();
        
        let titles = ["Doggo", "Small Doggo" , "Even Smaller doggo"];
        let descriptions = ["Walking along", "Sleepy pupper", "Confidence."]
        let pictures = ["puppy.jpg", "doggo.jpg", "strut.jpg"]
        let locations = ["San Luis Obispo, CA", "East Coast", "Santa Maria, CA"]

        
        for i in 0...(titles.count-1) {
            currentTales.append(TalesData(title: titles[i], description: descriptions[i], picture: pictures[i], location: locations[i]));
        }
        
        tales += currentTales;
    }
    
    private func saveTales() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(tales, toFile: TalesData.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Tales successfully saved.", log: OSLog.default, type: .debug)
            print("Tales saved");
        } else {
            os_log("Failed to save tales...", log: OSLog.default, type: .error)
            print("Tales did not save");
        }
    }
    
    private func loadTales() -> [TalesData]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: TalesData.ArchiveURL.path) as? [TalesData]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
