# executes code to minify javascript using node-minify --compressor uglify-js --input 'input.js' --output 'output.js'
function jsmin
  set output (string replace ".js" ".min.js" "$argv")
  node-minify --compressor uglify-js --input $argv --output $output
end
