//
//  ContentView.swift
//  MTCard
//
//  Created by Mehmet Tekin on 26.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 22 / 255, green: 26 / 255, blue: 48 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("mtekin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 261.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2)
                    )
                Text("Mehmet Tekin")
                    .font(.custom("Pacifico-Regular.ttf", size: 30))
                    .bold()
                    .italic()
                    .foregroundColor(Color.white)
                Text("iOS Engineer")
                    .font(Font.custom("Pacifico-Regular.ttf", size: 24))
                    .bold()
                    .foregroundStyle(.white)
                Divider()
                InfoView(text: "+90 539 123 45 67", imageName: "phone.fill")
                InfoView(text: "tekinmdev@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}


