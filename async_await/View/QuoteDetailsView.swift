//
//  QuoteDetailsView.swift
//  async_await
//
//  Created by Maxime VIDALINC on 18/12/2022.
//

import SwiftUI

struct QuoteDetailsView: View {
    var quote: Quote
    
    @State private var waifu = Waifu(url: "")
    
    var body: some View {
            VStack{
                AsyncImage(
                    url: URL(string: waifu.url),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 300)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Text(quote.character)
                    .font(.headline)
                .foregroundColor(Color("skyBlue"))
                Text(quote.anime)
                    .font(.title3)
                Text(quote.quote)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .task {
                waifu = await WaifuReposotiry().getImgWaifuSfw()
            }
    }
}

struct QuoteDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailsView(quote:  Quote(
            anime: "Demon Slayer",
            character: "Nezuko",
            quote: ".....")
        )
    }
}
