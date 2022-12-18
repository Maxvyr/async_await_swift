//
//  ContentView.swift
//  async_await
//
//  Created by Maxime VIDALINC on 17/12/2022.
//

import SwiftUI

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
               quotes = await QuoteRepository().fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
