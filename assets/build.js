const esbuild = require("esbuild")
const sveltePlugin = require("esbuild-svelte")


const args = process.argv.slice(2)
const watch = args.includes('--watch')
const deploy = args.includes('--deploy')

let opts = {
  entryPoints: ['js/app.js'],
  bundle: true,
  target: 'es2016',
  outdir: '../priv/static/assets',
  logLevel: 'info',
  plugins: [
    sveltePlugin()
  ]
}

if (watch) {
  opts = {
    ...opts,
    watch,
    sourcemap: 'inline'
  }
}

if (deploy) {
  opts = {
    ...opts,
    minify: true
  }
}

const promise = esbuild.build(opts)

if (watch) {
  promise.then(_result => {
    process.stdin.on('close', () => {
      process.exit(0)
    })

    process.stdin.resume()
  })
}