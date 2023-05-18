//
//  Model.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 18.05.2023.
//

import SwiftUI

struct Model: Codable {
    var description: String
    var imageUrl: URL?
    
    static let defaultImage = Model(description: "Cute Panda",
                                    imageUrl: URL(string: "https://assets.devpubs.apple.com/playgrounds/_assets/pandas/pandaBuggingOut.jpg"))
}
struct ModelCollection: Codable {
    var sample: [Model]
}
