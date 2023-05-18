//
//  AddTextButton.swift
//  FunnyMemes
//
//  Created by Роман Замолотов on 19.05.2023.
//

import SwiftUI

struct AddTextButton: View {
    var body: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: "textformat")
                    .font(.largeTitle)
                    .padding(.bottom, 4)
                Text("Add Text")
            }
        }
        .buttonStyle(.bordered)
        .controlSize(.large)
  
    }
}

struct AddTextButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTextButton()
    }
}
