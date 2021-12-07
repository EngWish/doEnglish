//
//  API.swift
//  you-can-english
//
//  Created by Qin Ying Chen on 12/6/21.
//

import Foundation

struct API {
    
    static func getSynonyms(word:String, completion: @escaping ([[String:Any]]?) -> Void) {
        let apikey = "2981c792-ea00-4165-8e09-1025081dbfb5"
        
        let url = URL(string: " https://www.dictionaryapi.com/api/v3/references/thesaurus/json/\(word)?key=\(apikey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of synonyms
                    let syns = dataDictionary["syns"] as! [[String:Any]]
                    return completion(syns)
             }
        }
        task.resume()
    }
}
