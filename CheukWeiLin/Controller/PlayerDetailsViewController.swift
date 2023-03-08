//
//  PlayerDetailsViewController.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 06/03/2023.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    var playerData : Player!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var playerKitTitle: UILabel!
    @IBOutlet weak var playerKit: UIImageView!
    @IBOutlet weak var playerKitName: UILabel!
    @IBOutlet weak var playerKitSubtext: UILabel!
    @IBOutlet weak var playerKitPrice: UILabel!
    
    @IBOutlet weak var buyKitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Kit Detail"
        
        playerKitTitle.text = playerData.name + "'S KIT"
        playerKit.image = UIImage(named: playerData.kitImage)
        playerKitName.text = playerData.fullname + "'s"
        playerKitSubtext.text = "Kit - No. " + playerData.number
        playerKitPrice.text = playerData.kitPrice
        
        buyKitButton.layer.cornerRadius = 8
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2"{
            let destinationController = segue.destination as! WebViewController

            destinationController.playerData = self.playerData
        }
    }
}

extension PlayerDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Name Printing"
            cell.detailTextLabel?.text = playerData.name
        }
        
        if indexPath.row == 1 {
            cell.textLabel?.text = "Number Printing"
            cell.detailTextLabel?.text = playerData.number
        }
        
        if indexPath.row == 2 {
            cell.textLabel?.text = "Size"
            cell.detailTextLabel?.text = playerData.kitSize
        }
        
        if indexPath.row == 3 {
            cell.textLabel?.text = "Fit"
            cell.detailTextLabel?.text = playerData.kitFit
        }
        
        if indexPath.row == 4 {
            cell.textLabel?.text = "Shipping"
            cell.detailTextLabel?.text = playerData.kitShipping
        }      

        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 7 {
            return 80.0
        } else {
            return 40.0;
        }
    }
    
}

