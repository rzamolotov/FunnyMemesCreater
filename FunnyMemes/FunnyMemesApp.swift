//
//  FunnyMemesApp.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 18.05.2023.
//

import SwiftUI

@main
struct FunnyMemesApp: App {
    @StateObject private var fetcher = ImageFetcher()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fetcher)
        }
    }
}
