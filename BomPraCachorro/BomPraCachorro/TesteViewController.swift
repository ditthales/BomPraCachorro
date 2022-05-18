//
//  File.swift
//  BomPraCachorro
//
//  Created by ditthales on 18/05/22.
//

import Foundation
import UIKit

class TesteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var tableViewOne: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profilePic.layer.cornerRadius = 16
        tableViewOne.delegate = self
        tableViewOne.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOne.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! CelulaTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
}
