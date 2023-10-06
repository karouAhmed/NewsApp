//
//  Article.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//
import Foundation
/// Représente la réponse d'un service API contenant une liste d'articles.
struct ArticleResponse: Codable {
    /// Le nombre total d'articles disponibles.
    let totalResults: Int

    /// La liste des articles.
    let articles: [Article]
}

/// Représente un article de presse avec ses détails.
struct Article: Codable, Equatable, Identifiable {
    /// L'identifiant unique de l'article généré par UUID.
    let id: UUID = UUID()

    /// Le nom de l'auteur de l'article.
    let author: String

    /// Le titre de l'article.
    let title: String

    /// La description de l'article.
    let description: String

    /// L'URL complète de l'article.
    let url: String

    /// L'URL de l'image associée à l'article.
    let urlToImage: String

    /// La date de publication de l'article au format de chaîne de caractères.
    let publishedAt: String

    /// Le contenu complet de l'article.
    let content: String

    /// Comparaison entre deux articles pour l'équatabilité.
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.url == rhs.url
    }
}

extension Article {
    /// Un exemple d'article utilisé à des fins de test ou de démo.
    static var dummyData: Article {
        .init(author: "Le Monde avec AFP",
              title: "Titre de l'article",
              description: "Description de l'article.",
              url: "https://www.example.com/article",
              urlToImage: "https://www.example.com/image.jpg",
              publishedAt: "2023-10-06 10:26:10",
              content: "Contenu complet de l'article.")
    }
}
