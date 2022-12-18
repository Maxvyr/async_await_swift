//
//  WaifuRepository.swift
//  async_await
//
//  Created by Maxime VIDALINC on 18/12/2022.
//

import Foundation

class WaifuReposotiry {
    private let waifuBase = Waifu(url: "https://i.waifu.pics/r0UW03D.jpg")
    
    func getImgWaifuSfw() async -> Waifu {
        let urlString = "https://api.waifu.pics/sfw/waifu"
        guard let url = URL(string: urlString) else {
            return waifuBase
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let resWaifu = try? JSONDecoder().decode(Waifu.self, from: data) {
                return resWaifu
            } else {
                return waifuBase
            }
        } catch {
            print(error.localizedDescription)
            return waifuBase
        }
    }
}
