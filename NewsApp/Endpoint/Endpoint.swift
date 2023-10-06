//
//  Endpoint.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//

import Foundation

/// Le base de l'URL de l'API de News.
public let baseURLPath: String = "https://newsapi.org/v2"


/// Enumération des points de terminaison de l'API de News.
enum URLEndpoint: RawRepresentable {
    typealias RawValue = String

    /// Point de terminaison pour charger les nouvelles en fonction de la page et du nombre d'articles par page.
    case loadNews(page: Int, perPage: Int)

    init?(rawValue: RawValue) {
        fatalError()
    }
    /// Propriété calculée qui retourne l'URL complète du point de terminaison en fonction de la page et du nombre d'articles par page.
    var rawValue: String {
        switch self {
        case let .loadNews(page, perPage):
            return baseURLPath + "/everything?q=appel&apiKey=\(Constants.apiKey)&language=fr&pageSize=\(perPage)&page=\(page)"

        }
    }
}
