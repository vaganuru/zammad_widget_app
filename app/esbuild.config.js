// esbuild.config.js
const esbuild = require("esbuild");
const vuePlugin = require("esbuild-plugin-vue").default;

esbuild.build({
  entryPoints: ["app/frontend/desktop.ts"],
  bundle: true,
  outdir: "app/assets/builds",
  format: "esm",
  plugins: [vuePlugin()],
  define: {
    "__VUE_OPTIONS_API__": '"true"',
    "__VUE_PROD_DEVTOOLS__": '"false"'
  },
  sourcemap: true,
  minify: false,
}).catch(() => process.exit(1));
