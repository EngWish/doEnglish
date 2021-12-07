//
//  SynViewController.swift
//  you-can-english
//
//  Created by Qin Ying Chen on 12/6/21.
//

import UIKit

class SynViewController: UIViewController {
    
    var synonymsArray:[[String: Any]] = []
    var word:String = "sad"
    @IBOutlet weak var wordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        displayQuestion()
        wordLabel.text = word
        
        let url = URL(string: "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/\(word)?key=2981c792-ea00-4165-8e09-1025081dbfb5")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionaryTemp = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                    let dataDictionary = dataDictionaryTemp[0]
                    let metaTemp = dataDictionary["meta"] as! [String : Any]
                    let synTemp = metaTemp["syns"]

//                    // TODO: Get the array of synonyms
//                    self.synonymsArray = dataDictionary["syns"] as! [[String:Any]]
                print(synTemp)
             }
        }
        task.resume()
        
//        print(synonymsArray)
    }
    
    func displayQuestion(){
        wordLabel.text = word
//        getAPIData()
        print(synonymsArray)
    }
    
//    func getAPIData(){
//
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
