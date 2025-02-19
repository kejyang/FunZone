//
//  SongsViewController.swift
//  FunZone
//
//  Created by admin on 12/29/24.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongsTableViewCell
        /*cell.songName?.text = songData[indexPath.row]
        cell.songImg?.image = UIImage(named: songImgData[indexPath.row])*/
        cell.contentView.layer.cornerRadius = 5
        //cell.contentView.layer.masksToBounds = true
        //cell.contentView.backgroundColor = .white
        
        cell.backgroundColor = .clear
        tableView.backgroundColor = .clear
        //cell.imageView.layer.cornerRadius = imageView.frame.size.width / 2
        //cell.imageView?.clipsToBounds = true
        cell.songName?.text = songsData[indexPath.row].title
        cell.songImg?.image = UIImage(named: songsData[indexPath.row].cover)
        cell.artistName?.text = songsData[indexPath.row].artist
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var songsData : [Song] = []
    var songData : [String] = []
    var songImgData : [String] = []
    var defaultSongData : [Song] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        songData = ["I Will Survive", "Roundabout"]
        songImgData = ["IWillSurviveImg", "roundaboutImg"]
        let iWillSurvive = Song(title: "I Will Survive", artist: "Gloria Gaynor", cover: "IWillSurviveImg", mp3: "I Will Survive")
        let roundabout = Song(title: "Roundabout", artist: "Yes", cover: "roundaboutImg", mp3: "Roundabout")
        let imStillStanding = Song(title: "I'm Still Standing", artist: "Elton John", cover: "imStillStanding", mp3: "Im Still Standing")
        let flyMeToTheMoon = Song(title: "Fly Me to the Moon", artist: "Frank Sinatra", cover: "flyMeToTheMoonImg", mp3: "Fly Me To The Moon")
        songsData = [iWillSurvive, roundabout, imStillStanding, flyMeToTheMoon]
        defaultSongData = [iWillSurvive, roundabout, imStillStanding, flyMeToTheMoon]
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
            songsData = defaultSongData
        }
        else{
            songsData = songsData.filter{$0.title.lowercased().hasPrefix(searchText.lowercased())}
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
        secondVC.songTitle = songsData[indexPath.row].title
        secondVC.songImg = songsData[indexPath.row].cover
        secondVC.songArtist = songsData[indexPath.row].artist
        secondVC.mp3 = songsData[indexPath.row].mp3
        navigationController?.pushViewController(secondVC, animated: true)
        //present(secondVC, animated: true, completion: nil)
    }
    
}

//For row sizing
extension SongsViewController{
    func tableView(_ tableView : UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat{
        return 125
    }
}
