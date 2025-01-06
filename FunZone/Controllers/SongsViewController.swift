//
//  SongsViewController.swift
//  FunZone
//
//  Created by admin on 12/29/24.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongsTableViewCell
        cell.songName?.text = songData[indexPath.row]
        cell.songImg?.image = UIImage(named: songImgData[indexPath.row])
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var songData : [String] = []
    var songImgData : [String] = []
    let defaultSongData : [String] = ["I will survive", "Survivor"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        songData = ["I Will Survive", "Roundabout"]
        songImgData = ["IWillSurviveImg", "roundaboutImg"]
        tableView.delegate = self
        tableView.dataSource = self
        searchBarField.delegate = self
    }
    
    
    @IBOutlet weak var searchBarField: UISearchBar!

}
//Handle the in place search function
extension SongsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String){
        if searchText.isEmpty{
            songData = defaultSongData
        }
        else{
            songData = songData.filter{$0.hasPrefix(searchText)}
        }
        tableView.reloadData()
    }
    
}

//Handle moving to SongPlayerViewController and passing data
extension SongsViewController{
    func tableView(_ tableView : UITableView, didSelectRowAt indexPath: IndexPath){
        cellPressed(indexPath: indexPath)
    }
    func cellPressed(indexPath: IndexPath){
        var story = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = story.instantiateViewController(withIdentifier: "SongPlayer") as! SongPlayerViewController
        //secondVC.userName.text = name.text
        secondVC.songTitle = songData[indexPath.row]
        secondVC.songImg = songImgData[indexPath.row]
        navigationController?.pushViewController(secondVC, animated: true)
        //present(secondVC, animated: true, completion: nil)
    }
    
}

//For row sizing
extension SongsViewController{
    func tableView(_ tableView : UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat{
        return 75
    }
}
