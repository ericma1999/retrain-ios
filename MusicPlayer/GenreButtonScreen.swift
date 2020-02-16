//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Gan on 16/2/20.
//  Copyright © 2020 passawis. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        // reuest authorization
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
       
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    /*
     @IBAction func nextButtonTapped(_ sender: UIButton) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
