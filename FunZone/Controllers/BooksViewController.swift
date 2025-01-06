//
//  BooksViewController.swift
//  FunZone
//
//  Created by admin on 12/30/24.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BooksTableViewCell
        cell.bookName?.text = bookData[indexPath.row]
        cell.coverPicture?.image = UIImage(named: coverData[indexPath.row])
        cell.authorName?.text = authorData[indexPath.row]
        return cell
    }
    
    var bookData : [String] = []
    var coverData : [String] = []
    var authorData : [String] = []
    var curBookTitle : String = ""
    var curCoverImg : String = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        bookData = ["Moby Dick", "Wings"]
        coverData = ["mobyDickCover", "wingsCover"]
        authorData = ["Herman Melville", "Yi Sang"]
        tableView.delegate = self
        tableView.dataSource = self         // Do any additional setup after loading the view.
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
        curBookTitle = bookData[indexPath.row]
        curCoverImg = coverData[indexPath.row]
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
