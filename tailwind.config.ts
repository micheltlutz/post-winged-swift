import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './Sources/**/*.swift',
    './output/**/*.html',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        primary: '#000000',
        secondary: '#1a1a1a',
        accent: '#99cc00',
        'accent-light': '#b8e633',
        text: '#ffffff',
        'text-secondary': '#a0a0a0',
      },
    },
  },
  plugins: [],
}

export default config