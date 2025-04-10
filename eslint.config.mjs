import eslint from 'eslint'; // Default import
const { defineConfig } = eslint; // Destructure to get defineConfig

export default defineConfig([
  {
    parserOptions: {
      ecmaVersion: 2020,
      sourceType: 'module',
    },
    rules: {
      'no-undef': 'error',
      'no-unused-vars': 'warn',
    },
  },
  // Add additional config objects if needed
]);
