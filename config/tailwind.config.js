  const defaultTheme = require('tailwindcss/defaultTheme')

  module.exports = {
    content: [
      './public/*.html',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js',
      './app/views/**/*.{erb,haml,html,slim}'
    ],
    theme: {
      extend: {
        fontFamily: {
          sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        },
        fontSize: {
          'xxs': '.65rem', 
        },
        padding: {
          '5': '1.25rem',  
        },
        margin: {
          '5': '1.25rem', 
        },
      },
    },
    variants: {
      extend: {
        fontSize: ['print'],
        padding: ['print'],
        margin: ['print'],     
      },
    },
    plugins: [
      require('@tailwindcss/forms'),
      require('@tailwindcss/aspect-ratio'),
      require('@tailwindcss/typography'),
      require('@tailwindcss/container-queries'),
      require('@tailwindcss/forms'),
      function ({ addVariant }) {
        addVariant('print', ['@media print', '&'])
      },
      function({ addUtilities }) {
        const newUtilities = {
          '.page-break-before': {
            'page-break-before': 'always',
          },
          '.page-break-after': {
            'page-break-after': 'always',
          },
          '.page-break-inside': {
            'page-break-inside': 'avoid',
          },
        };
        addUtilities(newUtilities, ['responsive', 'hover']);
      },
    ]
  }
