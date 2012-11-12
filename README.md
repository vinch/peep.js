# shr

Sharing made simple.

## Prerequisites

We assume you have the following tools already installed:

**CoffeeScript**

    npm install -g coffee-script

**UglifyJS**
  
    npm install -g uglify-js

## Compilation

To compile, just run this command in your console:

    sh compile.sh

This will create two files in /public:

- shr.js
- shr.min.js

## Contribute

You can extend **shr** by adding more services and more themes.

To add a new service, add a new file in the /app/services folder. Just copy one existing service to create yours.
It just requires a constructor and a callback for the count.

To add a new theme, just add a new css file in the /themes folder. The name of your css stylesheet (without the extension) is the name of your theme.