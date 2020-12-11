//
//  fetching.swift
//  top 50 app
//
//  Created by CastorPay on 12/10/20.
//

import Foundation
class fetchedData: ObservableObject {
    @Published var results = [Result]()
    init() {
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/fr/ios-apps/top-free/all/50/explicit.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(RSS.self,from: data)
                DispatchQueue.main.async {
                    self.results = res.feed!.results!
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

