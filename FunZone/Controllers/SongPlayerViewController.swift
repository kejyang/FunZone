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
        playAudio()
        // Do any additional setup after loading the view.
    }
    
    var songTitle : String = ""
    var songImg : String = ""
        
    @IBOutlet weak var curTitle: UILabel!
    
    @IBOutlet weak var curImg: UIImageView!
    
    
    func playAudio() {
            // Locate the audio file in the app bundle
            guard let path = Bundle.main.path(forResource: "I Will Survive", ofType: "mp3") else {
                print("Audio file not found")
                return
            }
            
            let url = URL(fileURLWithPath: path)
            
            do {
                // Initialize the audio player
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play() // Start playback
                
                // Optional: Enable looping
                audioPlayer?.numberOfLoops = -1  // Infinite loop
                
            } catch let error {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }


}
