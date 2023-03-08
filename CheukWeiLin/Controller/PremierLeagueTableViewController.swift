//
//  PremierLeagueTableViewController.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 07/03/2023.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class PremierLeagueTableViewController: UITableViewController {
    
    // Make array
    var league = [PremierLeagueStats]()

    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON {
            self.tableView.reloadData()
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return league.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let league = league[indexPath.row]
        
        cell.positionLabel.text = String(league.position)
        let imgUrl = "https://resources.premierleague.com/premierleague/" + league.img
        cell.teamImageView.downloaded(from: URL(string : imgUrl)!)
        cell.teamLabel.text = league.team
        
        cell.mpLabel.text = String(league.mp)
        cell.wLabel.text = String(league.w)
        cell.dLabel.text = String(league.d)
        cell.lLabel.text = String(league.l)
        cell.ptsLabel.text = String(league.points)
        
        return cell
    }
    
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://my-json-server.typicode.com/CorruptX7/PremierLeagueTable/league_table")
        
        URLSession.shared.dataTask(with: url!) {data, response, err in
            
            if err == nil {
                do {
                    self.league = try JSONDecoder().decode([PremierLeagueStats].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("Error fetching data from API")
                }
            }
        }.resume()
    }

}
