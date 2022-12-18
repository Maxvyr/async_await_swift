//
//  QuoteRepository.swift
//  async_await
//
//  Created by Maxime VIDALINC on 18/12/2022.
//

import Foundation

class QuoteRepository {
    func fetchData() async -> [Quote] {
        let urlString = "https://animechan.vercel.app/api/quotes"
        //create url
        guard let url = URL(string: urlString) else {
            print("THIS URL DOESN'T WORK")
            return []
        }
        
        //fetch data
        do {
            let (data , _) = try await URLSession.shared.data(from: url)
            
            if let decodeResponse = try? JSONDecoder().decode([Quote].self, from: data) {
                return decodeResponse
            } else {
                return []
            }
        } catch {
            print("EUH")
            print(error.localizedDescription)
            return []
        }
    }
}
