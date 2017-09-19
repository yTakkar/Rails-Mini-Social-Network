const path = require('path')

module.exports = {
  entry: './public/js/src/main.js',
  output: {
    path: path.join(__dirname, '/public/js/dist/'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      }
    ]
  },
  watch: true
}
