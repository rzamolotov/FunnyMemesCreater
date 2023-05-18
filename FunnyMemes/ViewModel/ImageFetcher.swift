//
//  ImageFetcher.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 18.05.2023.
//

import SwiftUI

class ImageFetcher: ObservableObject {
    @Published var imageData = ModelCollection(sample: [Model.defaultImage])
    @Published var currentPanda = Model.defaultImage
    
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
     func fetchData() async
     throws  {
        guard let url = URL(string: urlString) else { return }

        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }

        Task { @MainActor in
            imageData = try JSONDecoder().decode(ModelCollection.self, from: data)
        }
    }
}
