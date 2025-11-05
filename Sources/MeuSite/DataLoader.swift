// Sources/MeuSite/DataLoader.swift
import Foundation

struct DataLoader {
    static func loadAppConfig(from path: String = "./content.json") -> AppConfig? {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let config = try? JSONDecoder().decode(AppConfig.self, from: data) else {
            return nil
        }
        return config
    }
    
    static func getDefaultConfig() -> AppConfig {
        return AppConfig(
            name: "Meu App",
            description: "Descrição completa do aplicativo",
            shortDescription: "Uma descrição curta e impactante",
            appStoreURL: "https://apps.apple.com/app/meu-app",
            screenshot: "./assets/images/screenshot.png",
            logo: "./assets/images/logo.png",
            features: [
                Feature(
                    id: 1,
                    title: "Feature 1",
                    description: "Descrição detalhada da primeira feature",
                    icon: "star.svg",
                    order: 1
                ),
                Feature(
                    id: 2,
                    title: "Feature 2",
                    description: "Descrição detalhada da segunda feature",
                    icon: "heart.svg",
                    order: 2
                )
            ]
        )
    }
}