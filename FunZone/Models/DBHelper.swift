//
//  DBHelper.swift
//  FunZone
//
//  Created by admin on 1/4/25.
//

import Foundation
import CoreData

class DBHelper{
    let context = PersistentStorage.shared.context
    static let shared = DBHelper()
    
    func addData( noteText: String, date: Date){
        let note = NSEntityDescription.insertNewObject(forEntityName:"Note", into: context) as? Note
        note?.noteText = noteText
        note?.timestamp = date
        do{
            try context.save()
            print("data saved")
        }
        catch let error{
            print("error \(error)")
        }
    }
    
    func getData() -> [Note]{
        var notes: [Note] = []
        var fetchRequest: NSFetchRequest<Note> = NSFetchRequest<Note>(entityName: "Note")
        do{
            notes = try context.fetch(fetchRequest)
                 as! [Note]
        }
        catch let error{
            print("error \(error)")
        }
        return notes
    }
    
    func updateData(noteText: String, editedNoteText: String){
        var note : Note? = Note()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Note")
        fetchRequest.predicate = NSPredicate(format: "noteText == %@", noteText)
        do{
            let request = try context.fetch(fetchRequest) as! [Note]
            if request.count > 0{
                note = request.first
                note?.noteText = editedNoteText
                try context.save()
                print("data updated")
            }
        }
        catch let error{
             print("error \(error)")
        }
    }
    
    func deleteData(note: Note){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Note")
        fetchRequest.predicate = NSPredicate(format: "timestamp == %@", note.timestamp! as CVarArg)
        do{
            let request = try context.fetch(fetchRequest) as! [Note]
            context.delete(note)
            try context.save()
        }
        catch let error{
             print("error \(error)")
        }
    }
    
}

//For user operations
extension DBHelper{
    func addUser( username: String, password: String){
        let user = NSEntityDescription.insertNewObject(forEntityName:"UserEntity", into: context) as? UserEntity
        user?.username = username
        user?.password = password
        do{
            try context.save()
            print("data saved")
        }
        catch let error{
            print("error \(error)")
        }
    }
    
    func getUser(username: String) -> UserEntity? {
        var student : UserEntity? = UserEntity()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"UserEntity")
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        do{
            let request = try context.fetch(fetchRequest) as! [UserEntity]
            if request.count > 0{
                student = request.first
            }
            else{
                student = nil
                print("no data")
            }
        }
        catch let error{
            print("error \(error)")
        }
        return student
    }
}
