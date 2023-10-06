//
//  ArticleRow.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//

import SwiftUI

struct ArticleRow: View {
    var article: Article

    var body: some View {
        HStack {
            // Affichez l'image de l'article
            RemoteImage(url: article.urlToImage)
                .frame(height: 40)
                .clipped()
                .cornerRadius(10)

            // Affichez le titre de l'article
            Text(article.title)
                .font(.caption)
                .lineLimit(3)
        }
        .padding(.vertical, 8)
    }
}



#Preview {
    ArticleRow(article: Article.dummyData)
}
