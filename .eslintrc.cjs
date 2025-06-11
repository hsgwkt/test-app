module.exports = {
  parser: '@typescript-eslint/parser',
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:prettier/recommended', // Prettierプラグインの推奨設定を有効化
  ],
  plugins: ['@typescript-eslint', 'prettier'],
  parserOptions: {
    ecmaVersion: 2020,
    sourceType: 'module',
  },
  env: {
    browser: true, // ブラウザ環境のグローバル変数を有効化
    es2021: true,
    node: true, // Node.js環境のグローバル変数を有効化 (vite.config.jsなどのため)
  },
  rules: {
    'prettier/prettier': 'error', // Prettierのルール違反をESLintエラーとして報告
    // 必要に応じて追加のルールをここに記述
  },
  ignorePatterns: ['dist/', 'node_modules/', 'vite.config.ts'], // vite.config.ts はESLintの対象外とする
};
