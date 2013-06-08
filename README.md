Coffeeplate
===========
CoffeeScript Project Template:

#### What's included

* Gruntfile for CoffeeScript and Stylus
* Modules -> jQuery, Lo-Dash, RequireJs
* Mocha+expect+sinon testing with Testem
* Editorconfig file for each language

Installation
------------
Clone this.
```
$ git clone git@github.com:bamtsk/coffeeplate.git
```

Delete `.git`.
```
$ rm -rf .git
```

Usage
----
Install modules.
```
$ npm install
```

### Grunt commands

#### init

Js libraries install to `/public/scripts/libs`.
```
$ grunt init
```

#### compile

Compile `src/**/*.coffee` and `test/**/*.coffee` and `res/**/*.styl`.
```
$ grunt compile
```

#### build

Concat and uglify and cssmin.
```
$ grunt build
```

#### generate

Generate website to public.
```
$ grunt generate
```

#### preview

Access to localhost:9000.
```
$ grunt preview
```

### Testing

Run with testem.
```
$ testem
```

### CoffeeLint

```
$ coffeelint -f config.json hoge.coffee
```
