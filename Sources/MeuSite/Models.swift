// Sources/MeuSite/Models.swift
import Foundation

struct Feature: Codable {
    let id: Int
    let title: String
    let description: String
    let icon: String
    let order: Int
}

struct AppConfig: Codable {
    let name: String
    let description: String
    let shortDescription: String
    let appStoreURL: String
    let screenshot: String
    let logo: String
    let features: [Feature]
}

// Configurações do site
struct Config {
    static let outputDir = "./output"
    static let siteName = "Meu App"
    static let siteDescription = "Descrição do meu aplicativo"
    static let siteURL = "https://meuapp.com"
    static let author = "Seu Nome"
    static let accentColor = "#99cc00"
    static let googleAnalyticsID = "G-XXXXXXXXXX"
}