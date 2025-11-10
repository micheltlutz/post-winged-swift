# WingedSwift Static Site Example

> Example project that generates a static landing page using [WingedSwift](https://github.com/micheltlutz/Winged-Swift) and Tailwind CSS. Inspired by the Medium post “[Criando uma Página Estática com WingedSwift e Tailwind CSS](https://micheltlutz.medium.com/criando-uma-p%C3%A1gina-est%C3%A1tica-com-wingedswift-e-tailwind-css-42578f235be9)”.

---

## 🇧🇷 Visão Geral (PT-BR)

Este repositório demonstra como usar **WingedSwift** para gerar HTML estaticamente com uma DSL tipada em Swift, combinando com Tailwind CSS para estilização moderna. O gerador principal monta uma página com seção hero, lista de features e integração com Google Analytics.

```13:37:Sources/MeuSite/MeuSite.swift
let config = DataLoader.loadAppConfig() ?? DataLoader.getDefaultConfig()
let generator = StaticSiteGenerator(outputDirectory: Config.outputDir)
let mainPage = createMainPage(config: config)
try generator.generate(
    page: mainPage,
    to: "index.html",
    pretty: false
)
```

```22:37:Sources/MeuSite/DataLoader.swift
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
```

### Pré-requisitos
- macOS 12 ou superior com Swift 5.9+
- Node.js 18+ (para Tailwind CSS)
- Bash

### Como executar
1. Instale as dependências Swift:
   ```bash
   swift build
   ```
2. Instale o Tailwind CSS:
   ```bash
   npm install
   ```
3. Gere o site:
   ```bash
   chmod +x build.sh
   ./build.sh
   ```
4. Sirva localmente (opcional):
   ```bash
   cd output
   python3 -m http.server 8000
   ```

### Estrutura do projeto
- `Sources/MeuSite/` – Código Swift que define dados (`Models.swift`), carrega o conteúdo (`DataLoader.swift`) e gera o HTML (`MeuSite.swift`).
- `assets/` – Imagens, ícones e arquivo `tailwind.input.css`.
- `output/` – Site pronto para deploy, gerado após rodar o build.
- `build.sh` – Script que compila Swift, gera HTML e processa o Tailwind CSS.
- `content.json` – Fonte opcional de conteúdo externo (substitui o default em `DataLoader`).

### Personalização
- Atualize `content.json` ou `DataLoader.getDefaultConfig()` para mudar textos, ícones e links.
- Ajuste cores, tipografia e componentes no `tailwind.input.css` ou `tailwind.config.ts`.
- Edite `Config` em `Models.swift` para configurar metadados, Google Analytics e URL base.

### Deploy
- Publique o conteúdo de `output/` em qualquer serviço de hospedagem estática (GitHub Pages, Netlify, AWS Amplify, Vercel, etc).
- Caso use pipelines CI/CD, basta acionar o script `./build.sh` e fazer upload da pasta `output/`.

### Recursos relacionados
- Artigo completo com passo a passo: [Criando uma Página Estática com WingedSwift e Tailwind CSS](https://micheltlutz.medium.com/criando-uma-p%C3%A1gina-est%C3%A1tica-com-wingedswift-e-tailwind-css-42578f235be9)
- Biblioteca principal WingedSwift: [github.com/micheltlutz/Winged-Swift](https://github.com/micheltlutz/Winged-Swift)

---

## 🇺🇸 Overview (EN-US)

This repository showcases how to combine **WingedSwift** with Tailwind CSS to build a fully static landing page using a type-safe Swift DSL. The generator assembles a hero section, feature grid, and Google Analytics integration before exporting the final HTML.

### Prerequisites
- macOS 12 or newer with Swift 5.9+
- Node.js 18+ (Tailwind CSS build)
- Bash shell

### Quick start
```bash
swift build
npm install
chmod +x build.sh
./build.sh
```

Serve locally:
```bash
cd output
python3 -m http.server 8000
```

### Project layout
- `Sources/MeuSite/` – Swift source. `Models.swift` defines data structures and configuration, `DataLoader.swift` loads JSON or defaults, and `MeuSite.swift` renders the HTML tree using WingedSwift primitives.
- `assets/` – Images, icons, and Tailwind input CSS.
- `output/` – Generated static site ready for deployment.
- `build.sh` – Automates Swift build, HTML generation, asset copying, and Tailwind compilation.
- `content.json` – Optional content source if you prefer editing JSON instead of Swift code.

### Customization tips
- Update `content.json` or tweak `DataLoader.getDefaultConfig()` to change copy, feature cards, and imagery.
- Tweak Tailwind styles in `assets/css/tailwind.input.css` or adjust tokens in `tailwind.config.ts`.
- Edit `Config` inside `Models.swift` to switch site metadata, analytics ID, or base URLs.

### Deployment
Deploy the `output/` directory to any static hosting provider. The build script ensures CSS and assets are already optimized, so you can push the folder directly to services such as GitHub Pages, Netlify, Vercel, Fly.io, or AWS Amplify.

### Further reading
- Step-by-step Medium tutorial: [Criando uma Página Estática com WingedSwift e Tailwind CSS](https://micheltlutz.medium.com/criando-uma-p%C3%A1gina-est%C3%A1tica-com-wingedswift-e-tailwind-css-42578f235be9)
- WingedSwift main repository: [github.com/micheltlutz/Winged-Swift](https://github.com/micheltlutz/Winged-Swift)

---

Feito com ❤️ em Swift.

