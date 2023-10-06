//
//  NetworkError.swift
//  NewsApp
//
//  Created by narfk on 05/10/2023.
//

import Foundation

/// Énumération des erreurs réseau possibles lors des appels API.
enum NetworkError: Error {
    /// L'URL fournie est invalide.
    case badURL

    /// Échec de décodage de l'objet depuis le service API.
    case decodingError

    /// Code d'erreur spécifique renvoyé par l'API.
    case errorCode(Int)

    /// Erreur inconnue non spécifiée.
    case unknown
}

extension NetworkError: LocalizedError {
    /// Renvoie une description locale de l'erreur basée sur son type.
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "URL invalide"
        case .decodingError:
            return "Échec du décodage de l'objet depuis le service API"
        case .errorCode(let code):
            return "\(code) - Code d'erreur de l'API"
        case .unknown:
            return "Erreur inconnue"
        }
    }
}

