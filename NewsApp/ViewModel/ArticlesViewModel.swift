//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//

import Foundation
/// ViewModel pour gérer les articles et l'état de l'interface utilisateur lié aux articles.
class ArticlesViewModel: ObservableObject {
    /// Liste des articles récupérés du service.
    @Published var articles: [Article] = []

    /// Indique si le chargement est en cours.
    @Published var isLoading = false

    /// Indique si une alerte d'erreur doit être affichée.
    @Published var showErrorAlert: Bool = false

    /// Message d'erreur affiché dans l'alerte.
    var errorMessage: String = ""

    /// Numéro de la page actuelle lors de la récupération des articles.
    private var currentPage = 1

    /// Nombre maximum d'articles à récupérer.
    private var maxArticles = 10

    /// Service pour récupérer les articles.
    private let newsService: ArticlesServiceProtocol

    /// Initialise le ViewModel avec le service spécifié.
    /// - Parameter newsService: Service pour récupérer les articles (par défaut, utilise le singleton `NewsService.shared`).
    init(newsService: ArticlesServiceProtocol = ArticlesService.shared) {
        self.newsService = newsService
    }

    /// Récupère les articles depuis le service et met à jour l'état de l'interface utilisateur en conséquence.
    func fetchArticles() {
        // Arrête le chargement si nous avons atteint le nombre maximum d'articles
        guard articles.count < maxArticles else {
            return
        }
        isLoading = true
        newsService.getArticles(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let articlesResponse):
                    self.maxArticles = articlesResponse.totalResults
                    self.articles.append(contentsOf: articlesResponse.articles)
                    self.currentPage += 1

                case .failure(let error):
                    // Gérer l'erreur en affichant une alerte avec le message d'erreur.
                    self.showErrorAlert = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
