//
//  SongPlayerViewController.swift
//  FunZone
//
//  Created by admin on 1/5/25.
//

import UIKit
import AVKit
import AVFoundation

class SongPlayerViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        curTitle.text = songTitle
        curImg?.image = UIImage(named: songImg)
        curArtist.text = songArtist
        pauseButton.isHidden = true
        guard let path = Bundle.main.path(forResource: mp3, ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            // Initialize the audio player
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            
        } catch let error {
            print("Error loading audio: \(error)")
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        
    }
    
    var songTitle : String = ""
    var songImg : String = ""
    var songArtist : String = ""
    var mp3 : String = ""
        
    @IBOutlet weak var curTitle: UILabel!
    
    @IBOutlet weak var curImg: UIImageView!
    
    @IBOutlet weak var curArtist: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBAction func playSong(_ sender: Any) {
        // Locate the audio file in the app bundle
        audioPlayer?.play()
        playButton.isHidden = true
        pauseButton.isHidden = false
    }
    
    
    @IBAction func pauseAudio(_ sender: Any) {
        audioPlayer?.pause()
        playButton.isHidden = false
        pauseButton.isHidden = true
    }
    func playAudio() {
            
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
        playButton.isHidden = false
        pauseButton.isHidden = true
    }
    
    


}
