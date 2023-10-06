//
//  ContentView.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isActive : Bool = false
    @State private var size = 0.1
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ArticlesListView()
        } else {
            VStack {
                VStack {
                    Image("logo")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.5
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
