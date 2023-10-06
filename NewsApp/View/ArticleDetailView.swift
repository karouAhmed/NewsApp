//
//  ArticleDetailView.swift
//  NewsApp
//
//  Created by narfk on 06/10/2023.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Article

       var body: some View {
           VStack(alignment: .leading, spacing: 10) {
               Text(article.title)
                   .font(.title)
                   .padding(.bottom, 5)

               RemoteImage(url: article.urlToImage)
                               .frame(height: 200)
                               .clipped()
                               .cornerRadius(10)

               Text(article.description)
                   .font(.body)
                   .padding(.bottom, 10)

               Button("Lire l'article complet") {
                   if let url = URL(string: article.url) {
                       UIApplication.shared.open(url)
                   }
               }

               Spacer()
           }
           .padding()
           .navigationBarTitle("Détails de la News")
       }
}

#Preview {
    ArticleDetailView(article: Article.dummyData)
}
