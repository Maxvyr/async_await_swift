//
//  QuoteCell.swift
//  async_await
//
//  Created by Maxime VIDALINC on 18/12/2022.
//

import SwiftUI

struct QuoteCell: View {
    var quote : Quote
    
    var body: some View {
        VStack(alignment: .leading)  {
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
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCell(quote: Quote(
            anime: "Demon Slayer",
            character: "Nezuko",
            quote: ".....")
        )
    }
}
