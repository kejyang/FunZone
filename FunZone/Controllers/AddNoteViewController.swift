//
//  AddNoteViewController.swift
//  FunZone
//
//  Created by admin on 12/30/24.
//

import UIKit

class AddNoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var newNoteTextView: UITextView!
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let note = newNoteTextView.text {
            //NotesViewController.noteData.insert(note, at: 0)
        }

        
        performSegue(withIdentifier: "backToNotesScene", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        let currentDate = Date()
        DBHelper.shared.addData(noteText: newNoteTextView.text, date: currentDate)
    }
    
    /*override func prepare(for segue : UIStoryboardSegue, sender : Any?){
        
        if segue.identifier == "backToNotesScene"{
            if let note = newNoteTextView.text {
                NotesViewcontroller.noteData.append(note)
            }
        }
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
