//
//  PlayerOverviewViewController.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 06/03/2023.
//

import UIKit

class PlayerOverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var playerData : Player!
    
    @IBOutlet weak var cardView: UIView!

    @IBOutlet weak var cardPlayerImage: UIImageView!
    @IBOutlet weak var cardPlayerName: UILabel!
    @IBOutlet weak var cardPlayerPosition: UILabel!
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var viewKitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the title
        title = "Player Overview"
        
        // Card View Design
        cardView.layer.cornerRadius = 8
        cardView.layer.shadowRadius = 1
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 2,
                                             height: 2)
        cardView.layer.shadowOpacity = 0.1
        
        
        // Card View - Image, Name & Position
        cardPlayerImage.image = UIImage(named: playerData.image)
        cardPlayerImage.layer.cornerRadius = cardPlayerImage.frame.height / 2
        cardPlayerImage.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        
        cardPlayerName.text = playerData.fullname
        cardPlayerPosition.text = playerData.position
        
        // Button Design
        moreInfoButton.layer.cornerRadius = 8
        viewKitButton.layer.cornerRadius = 8
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Name"
            cell.detailTextLabel?.text = playerData.fullname
        }
        
        if indexPath.row == 1 {
            cell.textLabel?.text = "Position"
            cell.detailTextLabel?.text = playerData.position
        }
        
        if indexPath.row == 2 {
            cell.textLabel?.text = "Number"
            cell.detailTextLabel?.text = playerData.number
        }
        
        if indexPath.row == 3 {
            cell.textLabel?.text = "Country"
            cell.detailTextLabel?.text = playerData.country
        }
        
        if indexPath.row == 4 {
            cell.textLabel?.text = "Joined"
            cell.detailTextLabel?.text = playerData.joined
        }
        
        if indexPath.row == 5 {
            cell.textLabel?.text = "Appearances"
            cell.detailTextLabel?.text = playerData.appearances
        }
        
        if indexPath.row == 6 {
            cell.textLabel?.text = "Goals"
            cell.detailTextLabel?.text = playerData.goals
        }

        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0;
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            let destinationController = segue.destination as! PlayerDetailsViewController

            destinationController.playerData = self.playerData
        } else if segue.identifier == "moreInfo"{
            let destinationController2 = segue.destination as! MoreInfoViewController

            destinationController2.playerData = self.playerData
        }
    }

}

