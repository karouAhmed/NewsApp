//
//  NewsListView.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//

import SwiftUI

struct ArticlesListView: View {
    @ObservedObject var viewModel = ArticlesViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.articles, id: \.id) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        ArticleRow(article: article)
                            .onAppear{
                                if article == viewModel.articles.last {
                                    viewModel.fetchArticles()
                                }
                            }
                    }
                }
                .onAppear {
                    self.viewModel.fetchArticles()
                }
                .navigationBarTitle("News")
            }
            if viewModel.isLoading {
                ProgressView()
            }
        }.alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Erreur"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    ArticlesListView()
}
