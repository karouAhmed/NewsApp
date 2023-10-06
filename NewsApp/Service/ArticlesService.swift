//
//  ArticlesService.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//

import Foundation

// Protocole pour le service de récupération des articles
protocol ArticlesServiceProtocol {
    func getArticles(page: Int, completion: @escaping ((Result<ArticleResponse, Error>) -> Void))
}

class ArticlesService: ArticlesServiceProtocol {

    // Partage une instance unique du service (Singleton)
    static let shared = ArticlesService()

    // Initialisateur privé pour assurer la création d'une seule instance (Singleton)
    internal init() { }

    /// Récupère les articles à partir de l'API en fonction du numéro de page spécifié.
    ///
    /// - Parameters:
    ///   - page: Le numéro de la page des articles à récupérer.
    ///   - completion: Une closure appelée une fois que la récupération est terminée. Contient un résultat de type `ArticleResponse` ou une erreur.
    func getArticles(page: Int, completion: @escaping ((Result<ArticleResponse, Error>) -> Void)) {

        // Construit l'URL pour récupérer les articles en fonction du numéro de page
        guard let articleURL = URL(string:URLEndpoint.loadNews(page: page, perPage: 10).rawValue) else {
            return completion(.failure(URLError(.badURL)))
        }

        // Effectue une tâche réseau asynchrone pour récupérer les données JSON à partir de l'URL
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: articleURL) { (data, response, error) in

                // Gère les erreurs possibles liées à la requête réseau
                if let error = error {
                    return completion(.failure(error))
                }

                // Vérifie si des données ont été récupérées
                guard let data = data else {
                    return completion(.failure(DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Data is nil"))))
                }

                // Vérifie le code de statut de la réponse
                if (200...299).contains((response as? HTTPURLResponse)?.statusCode ?? 0) {
                    do {
                        // Décode les données JSON en un objet `ArticleResponse`
                        let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
                        // Appelle la closure de complétion avec succès
                        DispatchQueue.main.async {
                            completion(.success(articleResponse))
                        }
                    } catch {
                        // Gère les erreurs de décodage JSON
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                } else {
                    // Gère les réponses de serveur invalides
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                    completion(.failure(URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: "Bad server response (\(statusCode))"])))
                }
            }.resume() // Lance la requête réseau
        }
    }
}



