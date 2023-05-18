//
//  ContentView.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 18.05.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fetcher: ImageFetcher
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            MemeTextView()
            Spacer()
            HStack{
                RandomImageButton()
                AddTextButton()
            }
            .padding()
            .task {
                try? await fetcher.fetchData()
            }            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
