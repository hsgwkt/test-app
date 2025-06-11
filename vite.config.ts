import { defineConfig } from 'vite'

// https://vitejs.dev/config/
export default defineConfig(() => {
  // command, mode 引数を削除
  // 常に環境変数 VITE_BASE_PATH を参照し、
  // 設定されていなければ '/' をデフォルトとする
  const base = process.env.VITE_BASE_PATH || '/'

  return {
    base: base,
  }
})
