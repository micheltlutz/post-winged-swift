#!/bin/bash

echo "🚀 Building site..."

# Limpar builds anteriores
rm -rf .build output

# Build Swift
echo "Building Swift project..."
swift build
if [ $? -ne 0 ]; then
    echo "❌ Swift build failed!"
    exit 1
fi

# Criar diretório output antes de gerar os arquivos
echo "Creating output directory..."
mkdir -p output/assets/images/icons
mkdir -p output/assets/css
mkdir -p output/assets/js

# Executar gerador (gera os arquivos HTML em output/)
echo "Generating HTML..."
.build/debug/MeuSite
if [ $? -ne 0 ]; then
    echo "❌ Site generation failed!"
    exit 1
fi

# Copiar assets
echo "Copying assets..."
cp -r assets/images/* output/assets/images/ 2>/dev/null || true
cp -r assets/js/* output/assets/js/ 2>/dev/null || true

# Instalar Tailwind CSS se necessário
if [ ! -d "node_modules" ]; then
    echo "Installing Tailwind CSS..."
    npm install
fi

# Compilar Tailwind CSS
echo "Compiling Tailwind CSS..."
# Garantir que o diretório CSS existe
mkdir -p ./output/assets/css
if [ -f "node_modules/.bin/tailwindcss" ]; then
    ./node_modules/.bin/tailwindcss -i ./assets/css/tailwind.input.css -o ./output/assets/css/style.css --minify
else
    npx --yes tailwindcss@latest -i ./assets/css/tailwind.input.css -o ./output/assets/css/style.css --minify
fi

echo "✅ Build complete! Site available in output/"