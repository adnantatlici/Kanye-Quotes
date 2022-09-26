//
//  ViewController.swift
//  Kanye Quotes
//
//  Created by Mustafa Adnan Tatlıcı on 15.08.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    
    @IBAction func randomButton(_ sender: Any) {
        
        let url = URL(string: "https://api.kanye.rest")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data? , response: URLResponse?, error: Error?) in
            if let error = error{
                print(error)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data! ,options: []) as! [ String: String ]
            DispatchQueue.main.async {
                self.firstLabel.text = json["quote"]
            }
        }
        task.resume()
    }
    
    


}

