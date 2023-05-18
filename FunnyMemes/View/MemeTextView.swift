//
//  MemeTextView.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 19.05.2023.
//

import SwiftUI

struct MemeTextView: View {
    @EnvironmentObject var fetcher: ImageFetcher
    
    @State private var memeText = ""
    @State private var textSize = 60.0
    @State private var textColor = Color.white
    @State private var offset = CGSize.zero
    @State private var position = CGPoint(x: 100, y: 100)
    
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        LoadableImage(imageMetadata: fetcher.currentPanda)
            .overlay(alignment: .bottom) {
                TextField(
                    "Meme Text",
                    text: $memeText,
                    prompt: Text("")
                )
                .font(.system(size: textSize, weight: .heavy))
                .shadow(radius: 10)
                .foregroundColor(textColor)
                .padding()
                .multilineTextAlignment(.center)
                .position(position)
                               .gesture(DragGesture()
                                   .updating($dragOffset) { value, state, _ in
                                       state = value.translation
                                   }
                                   .onEnded { value in
                                       self.position = CGPoint(
                                           x: self.position.x + value.translation.width,
                                           y: self.position.y + value.translation.height
                                       )
                                   }
                               )
            }
        if !memeText.isEmpty {
            VStack {
                HStack {
                    Text("Font Size")
                        .fontWeight(.semibold)
                    Slider(value: $textSize, in: 1...200)
                }
                
                HStack {
                    Text("Font Color")
                        .fontWeight(.semibold)
                    ColorPicker("Font Color", selection: $textColor)
                        .labelsHidden()
                        .frame(width: 124, height: 23, alignment: .leading)
                    Spacer()
                }
            }
            .padding(.vertical)
            .frame(maxWidth: 325)
            
        }

    }
}

struct MemeTextView_Previews: PreviewProvider {
    static var previews: some View {
        MemeTextView()
    }
}
