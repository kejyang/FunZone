//
//  EditNoteViewController.swift
//  FunZone
//
//  Created by admin on 12/31/24.
//

import UIKit

class EditNoteViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //noteTextView.text = NotesViewController.noteData[row]
        noteTextView.layer.cornerRadius = 12
        noteTextView.layer.masksToBounds = true
        noteTextView.text = noteText
        // Do any additional setup after loading the view.
    }
    
    var row : Int = 0
    var noteText : String = ""

    @IBOutlet weak var noteTextView: UITextView!
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let note = noteTextView.text {
            //NotesViewController.noteData[row] = note
        }
        performSegue(withIdentifier: "backFromNoteEdit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "backFromNoteEditt"{
            let destinationVC = segue.destination as? NotesViewController
            destinationVC!.noteData[row].noteText = noteTextView.text
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EditNoteViewController{
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        DBHelper.shared.updateData(noteText: noteText, editedNoteText: noteTextView.text!)
    }
}
