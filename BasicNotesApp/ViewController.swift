//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by Mehmet TIRPAN on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var enterNotes: UITextField!
    
    @IBOutlet weak var whenwill: UITextField!
    
    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//
//        bu kısmı tıklama fonksiyonundan sonra yazdık ve çağırdığımız any değerleri aşağıdaki default ile aynı olmalı çünkü onları çağırdık.
        let savednotes = UserDefaults.standard.object(forKey: "notes")
        let savedtimes = UserDefaults.standard.object(forKey: "times")
        
        // soru işaretli yaptığımızda string olarak cast etmeye çalışır ama ünlem olursa kesin öyledir diyordur.
        if let receivedNotes = savednotes as? String{
            notesLabel.text = "Work to Do: \(receivedNotes)"
        }
        
        if let receivedTimes = savedtimes as? String{
            timeLabel.text = "Time to Do: \(receivedTimes)"
        }
        
        
    }
    

    @IBAction func saveClicked(_ sender: Any) {
        notesLabel.text = "Work to Do: \(enterNotes.text!)" // \() yaparak metin içerisine de kodlamayı aktif edebiliriz.
        timeLabel.text = "Time to Do: \(whenwill.text!)"

        UserDefaults.standard.set(enterNotes.text!, forKey: "notes") // kaydatmek istediğimizi ve anahtar kelimeyi girdik burada userdefault ile bazı şeyleri cihaza kaydediyoruz.
        UserDefaults.standard.set(whenwill.text!, forKey: "times")
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "notes")
        UserDefaults.standard.removeObject(forKey: "times")

            notesLabel.text = "Work to Do: "

            timeLabel.text = "Time to Do: "
        
    
    }
    
    
    
    
    
}

