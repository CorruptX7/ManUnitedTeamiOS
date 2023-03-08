//
//  PlayersTableViewController.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 06/03/2023.
//

import UIKit

class PlayersTableViewController: UITableViewController {
    
    var playersData : Players!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playersData = Players(fromXMLfile: "players.xml")
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersData.getCount()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! PlayerTableViewCell
        
        let playerData = playersData.getPlayer(index: indexPath.row)
        cell.pNumberLabel.text = String(playerData.number)
        cell.pImageView.image = UIImage(named: playerData.image)
        cell.pNameLabel.text = playerData.fullname
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0;
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue0"{
            let destinationController = segue.destination as! PlayerOverviewViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let playerData = playersData.getPlayer(index: indexPath!.row)
            destinationController.playerData = playerData
        }
    }
}

