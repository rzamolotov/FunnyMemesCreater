//
//  RandomImageButton.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 19.05.2023.
//

import SwiftUI

struct RandomImageButton: View {
    @EnvironmentObject var fetcher: ImageFetcher
    
    var body: some View {
        Button {
            if let randomImage = fetcher.imageData.sample.randomElement() {
                fetcher.currentPanda = randomImage
            }
        } label: {
            VStack {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.largeTitle)
                    .padding(.bottom, 4)
                Text("Shuffle Photo")
            }
            .frame(maxWidth: 180, maxHeight: .infinity)
        }
        .buttonStyle(.bordered)
        .controlSize(.large)
    }
}

struct RandomImageButton_Previews: PreviewProvider {
    static var previews: some View {
        RandomImageButton()
    }
}
