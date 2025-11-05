// Sources/MeuSite/MeuSite.swift
import Foundation
import WingedSwift

@main
struct MeuSite {
    static func main() async throws {
        print("Gerando site...")
        
        // Carregar dados (JSON ou padrão)
        let config = DataLoader.loadAppConfig() ?? DataLoader.getDefaultConfig()
        
        let generator = StaticSiteGenerator(outputDirectory: Config.outputDir)
        let mainPage = createMainPage(config: config)
        
        try generator.generate(
            page: mainPage,
            to: "index.html",
            pretty: false
        )
        
        print("Site gerado com sucesso em: \(Config.outputDir)")
    }
    
    static func createMainPage(config: AppConfig) -> HTMLTag {
        return html {
            Head(children: [
                Meta(charset: "UTF-8"),
                Meta(name: "viewport", content: "width=device-width, initial-scale=1.0"),
                Title(content: "\(config.name) - \(Config.siteDescription)"),
                
                // SEO Meta Tags
                Meta(name: "description", content: config.description),
                Meta(name: "keywords", content: "app, ios, swift"),
                Meta(name: "author", content: Config.author),
                
                // Open Graph
                Meta(name: "og:title", content: config.name),
                Meta(name: "og:description", content: config.description),
                Meta(name: "og:type", content: "website"),
                Meta(name: "og:url", content: Config.siteURL),
                Meta(name: "og:image", content: "\(Config.siteURL)\(config.logo)"),
                
                // Tailwind CSS
                Link(href: "./assets/css/style.css", rel: "stylesheet"),
                
                // Google Analytics
                Script(attributes: [
                    Attribute(key: "async", value: ""),
                    Attribute(key: "src", value: "https://www.googletagmanager.com/gtag/js?id=\(Config.googleAnalyticsID)")
                ]),
                Script(attributes: [], content: """
                    window.dataLayer = window.dataLayer || [];
                    function gtag(){dataLayer.push(arguments);}
                    gtag('js', new Date());
                    gtag('config', '\(Config.googleAnalyticsID)');
                    """)
            ])
            
            Body(children: [
                createHeader(config: config),
                createHeroSection(config: config),
                createFeaturesSection(features: config.features),
                createFooter()
            ])
            .addClass("bg-black text-white min-h-screen")
        }
    }
    
    static func createHeader(config: AppConfig) -> HTMLTag {
        return Header(children: [
            Div(children: [
                Img(src: config.logo, alt: "\(config.name) Logo")
                    .addClass("w-12 h-12 rounded-xl"),
                HTMLTag("nav", children: [
                    HTMLTag("a", attributes: [
                        Attribute(key: "href", value: "#features"),
                        Attribute(key: "class", value: "text-white hover:text-accent transition-colors")
                    ], content: "Features")
                ])
                .addClass("ml-auto flex gap-6")
            ])
            .addClass("container mx-auto px-6 py-4 flex items-center")
        ])
        .addClass("bg-black border-b border-gray-800")
    }
    
    static func createHeroSection(config: AppConfig) -> HTMLTag {
        return Section(children: [
            Div(children: [
                Div(children: [
                    createIPhoneMockup(screenshot: config.screenshot)
                ])
                .addClass("flex justify-center"),
                
                Div(children: [
                    Div(children: [
                        Img(src: config.logo, alt: "\(config.name) Icon")
                            .addClass("w-20 h-20 rounded-2xl shadow-lg"),
                        Div(children: [
                            H1(content: config.name)
                                .addClass("text-5xl font-bold text-white mb-1"),
                            Span(content: "App")
                                .addClass("text-gray-400 text-xl")
                        ])
                        .addClass("ml-6")
                    ])
                    .addClass("flex items-center mb-6"),
                    
                    P(content: config.shortDescription)
                        .addClass("text-gray-300 text-lg leading-relaxed mb-8 max-w-lg"),
                    
                    HTMLTag("a", attributes: [
                        Attribute(key: "href", value: config.appStoreURL),
                        Attribute(key: "target", value: "_blank"),
                        Attribute(key: "rel", value: "noopener noreferrer")
                    ], children: [
                        Img(src: "./assets/images/app-store-badge.svg", alt: "Download on the App Store")
                            .addClass("h-14")
                    ])
                    .addClass("inline-block")
                ])
                .addClass("flex flex-col justify-center lg:pl-12")
            ])
            .addClass("container mx-auto px-6 py-16 lg:py-24 grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-16 items-center")
        ])
        .addClass("bg-black")
    }
    
    static func createIPhoneMockup(screenshot: String) -> HTMLTag {
        return Div(children: [
            Img(src: screenshot, alt: "App Screenshot")
                .addClass("w-full h-full object-cover rounded-[2.5rem]")
        ])
        .addClass("w-80 h-[694px] bg-black rounded-[3rem] border-8 border-gray-800 shadow-2xl overflow-hidden")
    }
    
    static func createFeaturesSection(features: [Feature]) -> HTMLTag {
        let sortedFeatures = features.sorted { $0.order < $1.order }
        let featureCards = sortedFeatures.map { feature in
            createFeatureCard(feature: feature)
        }
        
        return Section(children: [
            Div(children: [
                H2(content: "Recursos Principais")
                    .addClass("text-4xl font-bold text-center mb-16 text-white"),
                
                Div(children: featureCards)
                    .addClass("grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8")
            ])
            .addClass("container mx-auto px-6 py-16")
        ])
        .addClass("bg-black")
    }
    
    static func createFeatureCard(feature: Feature) -> HTMLTag {
        return Div(children: [
            Div(children: [
                Div(children: [
                    Img(src: "./assets/images/icons/\(feature.icon)", alt: feature.title)
                        .addClass("w-12 h-12")
                ])
                .addClass("flex justify-center mb-4"),
                
                H3(content: feature.title)
                    .addClass("text-xl font-bold text-white mb-3"),
                
                P(content: feature.description)
                    .addClass("text-gray-300 leading-relaxed flex-grow")
            ])
            .addClass("text-center p-8 bg-gray-800 rounded-lg hover:bg-gray-700 transition-colors flex flex-col h-full")
        ])
        .addClass("h-full")
    }
    
    static func createFooter() -> HTMLTag {
        return Footer(children: [
            Div(children: [
                P(content: "© 2024 \(Config.author). Todos os direitos reservados.")
                    .addClass("text-gray-400 text-center")
            ])
            .addClass("container mx-auto px-6 py-8")
        ])
        .addClass("bg-black border-t border-gray-800")
    }
}