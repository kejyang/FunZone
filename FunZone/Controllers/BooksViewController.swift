//
//  BooksViewController.swift
//  FunZone
//
//  Created by admin on 12/30/24.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return bookData.count
        booksData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BooksTableViewCell
        
        
        tableView.backgroundColor = .clear
        cell.bookName?.text = booksData[indexPath.row].title
        cell.coverPicture?.image = UIImage(named: booksData[indexPath.row].cover)
        cell.authorName?.text = booksData[indexPath.row].author
        return cell
    }
    var booksData : [Book] = []
    var defaultBooksData : [Book] = []
    var curBookTitle : String = ""
    var curCoverImg : String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
 
        let mobyDick = Book(title: "Moby Dick", cover: "mobyDickCover", author: "Herman Melville")
        let wings = Book(title: "Wings", cover: "wingsCover", author: "Yi Sang")
        let donQuixote = Book(title: "Don Quixote", cover: "donQuixoteCover", author: "Miguel de Cervantes")
        let hellScreen = Book(title: "Hell Screen", cover: "hellScreenCover", author: "Ryunosuke Akutagawa")
        booksData = [mobyDick, wings, donQuixote, hellScreen]
        defaultBooksData = [mobyDick, wings, donQuixote, hellScreen]
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
}

//For row sizing
extension BooksViewController{
    func tableView(_ tableView : UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat{
        return 150
    }
}
//For segueing into pdfviewer
extension BooksViewController{
    func tableView(_ tableView : UITableView, didSelectRowAt indexPath: IndexPath){
        /*curBookTitle = bookData[indexPath.row]
        curCoverImg = coverData[indexPath.row]*/
        curBookTitle = booksData[indexPath.row].title
        curCoverImg = booksData[indexPath.row].cover
        performSegue(withIdentifier: "goToPDF", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToPDF"{
            let destinationVC = segue.destination as? BookPDFViewController
            destinationVC!.bookTitle = curBookTitle
            destinationVC!.bookCover = curCoverImg
        }
    }
}

//Handle the in place search function

extension BooksViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String){
        print("at start of searchbarchange")
        if searchText.isEmpty{
            booksData = defaultBooksData
        }
        else{
            print("im here")
            booksData = booksData.filter{$0.title.lowercased().hasPrefix(searchText.lowercased())}
        }
        tableView.reloadData()
    }
    
}

