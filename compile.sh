coffee --output public --join shr.js --bare --compile app
uglifyjs --output public/shr.min.js public/shr.js