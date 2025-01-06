//
//  NotesViewController.swift
//  FunZone
//
//  Created by admin on 12/29/24.
//

import UIKit


class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NotesTableViewCell
        cell.noteText?.text = noteData[indexPath.row].noteText
        return cell
    }
    
    var noteData : [Note] = []
    var curNoteText : String = ""
    var curRow : Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //noteData = ["test1", "test2"]
        self.navigationItem.hidesBackButton = true
        /*noteData = (UserDefaults.standard.array(forKey: "notesArray") as? [String])!*/
        tableView.delegate = self
        tableView.dataSource = self
 
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView : UITableView, didSelectRowAt indexPath: IndexPath){
        curRow = indexPath.row
        curNoteText = noteData[indexPath.row].noteText!
        performSegue(withIdentifier: "goToEdit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToEdit"{
            let destinationVC = segue.destination as? EditNoteViewController
            destinationVC!.row = curRow
            destinationVC!.noteText = curNoteText
        }
    }
    
    
    @IBAction func addNoteVC(_ sender: UIButton) {
        print("Im in addNoteVC")
        var story = UIStoryboard(name: "Main", bundle: nil)
        let addNoteVC = story.instantiateViewController(withIdentifier: "addNote") as! AddNoteViewController
        navigationController?.pushViewController(addNoteVC, animated: true)
    }
    
    func tableView(_ tableView : UITableView, trailingSwipeActionsConfigurationForRowAt indexPath : IndexPath) -> UISwipeActionsConfiguration?{
        let deleteAction = UIContextualAction(style: .destructive, title:"Delete"){ _, _, completionHandler in
            let noteToDelete = self.noteData[indexPath.row]
            self.noteData.remove(at: indexPath.row)
            DBHelper.shared.deleteData(note: noteToDelete)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

extension NotesViewController {
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        noteData = DBHelper.shared.getData()
        tableView.reloadData()
    }
}
