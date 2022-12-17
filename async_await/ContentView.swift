//
//  ContentView.swift
//  async_await
//
//  Created by Maxime VIDALINC on 17/12/2022.
//

import SwiftUI

struct Quote: Codable {
    var anime: String
    var character: String
    var quote: String
}

struct ContentView: View {
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView {
            List(quotes, id: \.quote) { quote in
                VStack(alignment: .leading) {
                    Text(quote.character)
                        .font(.headline)
                        .foregroundColor(Color("skyBlue"))
                    Text(quote.anime)
                        .font(.title3)
                    Text(quote.quote)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Quotes")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        let urlString = "https://animechan.vercel.app/api/quotes"
        //create url
        guard let url = URL(string: urlString) else {
            print("THIS URL DOESN'T WORK")
            return
        }
        
        //fetch data
        do {
            let (data , _) = try await URLSession.shared.data(from: url)
            
            if let decodeResponse = try? JSONDecoder().decode([Quote].self, from: data) {
                quotes = decodeResponse
            }
        } catch {
            print("EUH")
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
