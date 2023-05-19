//
//  LoadableImage.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 18.05.2023.
//

import SwiftUI

struct LoadableImage: View {
    var imageMetadata: Model
    
    var body: some View {
        AsyncImage(url: imageMetadata.imageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .accessibility(hidden: false)
                    .accessibilityLabel(Text(imageMetadata.description))
            }  else if phase.error != nil  {
                ZStack {
                    Image("pandaplaceholder")
                        .resizable()
                        .scaledToFit()
                    VStack{
                        Text("Картинка не загрузилась?")
                            .font(.custom(fontBold, size: fontSizeExtraLarge))
                            .foregroundColor(.white)
                        Spacer()
                        Text("попробуйте еще раз")
                            .font(.custom(fontBold, size: fontSizeExtraLarge))
                            .foregroundColor(.white)
                    }
                    .padding([.bottom, .top])
                }
                .frame(width: screenWidth, height: screenWidth)
                .padding()
                
            } else {
                ProgressView()
            }
        }
    }
}

struct LoadableImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage(imageMetadata: Model.defaultImage)
    }
}
