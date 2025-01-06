//
//  BookPDFViewController.swift
//  FunZone
//
//  Created by admin on 1/5/25.
//

import UIKit
import PDFKit

class BookPDFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = UIColor.systemGreen
        customView.isHidden = true
        bookImg?.image = UIImage(named: bookCover)
        bookImg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
        bookImg?.addGestureRecognizer(tapGesture)
    }
    
    func onImgPress(){
        
    }
    
    @objc func imgTapped(){
        print("im here")
        let pdfView = PDFView(frame: customView.bounds)
        pdfView.autoScales = true
        let filepath = Bundle.main.url(forResource: bookTitle, withExtension: "pdf")
        pdfView.document = PDFDocument(url: filepath!)
        customView.addSubview(pdfView)
        bookImg.isHidden = true
        customView.isHidden = false
    }
    
    var bookTitle: String = ""
    var bookCover: String = ""
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var bookImg: UIImageView!
    
}
