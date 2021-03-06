# Node Getting Started Notes

## Callback

A function that Node will "call back" at a later point in time.

```js
function cb(data) {
    // do something
}
someAsyncMethod(cb)
```

```js
function keegan(makeLatte) {
    // drink latte
}
starbucks.makeMeALatte(keegan)
```

## Promises

```js
const egg = chicken.makeChick() // it's a promise
egg
    .then(chick => raiseChick()) // success outcome
    .catch(badEgg => throw badEgg) // fail outcome
```

## REPL

Read, Eval, Print, Loop

```js
Math.random()
let answer = 42
3 == '3'

"PI" in Math
//true

"NaN" in Number
//true

"length" in String
//true

var person = { firstname:"Keegan", lastname:"Mullaney", age:41 };
//undefined

"lastname" in person
//true

delete person.lastname
//true

"lastname" in person
//false

"age" in person
//true

function today() {
    return new Date()
}
//undefined

today
//[Function: today]

today()
//2020-01-10T23:39:01.751Z

//.editor
// Entering editor mode (^D to finish, ^C to cancel)
function add(x, y) {
    return x = y
}

function random() {
    return Math.random()
}
```

## node REPL commands

ctrl+D to exit or .exit  
.break to get our of editor  
.save filename to save the REPL session  
.load filename to load the lines from file and eval them  
. tab tab to see dot commands  
tab tab to see all commands

```sh
node -p "os.cpus().length"
node -p "process.versions.v8"
```

can name your own environment variables for use in scripts or functions

```sh
process.env.VAL
process.argv
> process
> process.stdout.write("hello\n")
```

Javascript is based on ECMAScript which gets updates annually  
Babel is a Javascript compiler and supports more recent features

npm i - this will install all package dependencies from a package.json file with versions  
specified in package-lock.json

node i -D will install development dependencies (--save-dev)  
node i --production - will not install devDependencies

npm version numbers  
4.2.0  
major.minor.patch  
breaking changes . backward compatible . bug fixes  

**~1.2.3 - an update can install the most recent patch version i.e. 1.2.4**  
**^1.2.3 - an update can install the most recent minor version i.e. 1.3.0**

```sh
npm i lodash@latest
npm i lodash@4 // will install latest version starting with major number 4
npm i loadash@4.1 // will install latest version starting with minor version 4.1
```

semver.npmjs.com

```sh
npm show "package-name" versions
```

`arguments` is a keyword to represent all the arguments passed into a function. Arguments can be  
provided to a function even if the function doesn't define any input args. It's a good way to
represent a dynamic set of arguments.

A module is a function (and a file or folder) that receives arguments and will return `arguments`.

`console.dir(global, { depth: 0 });` is how to print global variables like setTimeout, clearTimeout,
setInterval, clearInterval, setImmediate, clearImmediate.

## How to properly handle errors in js

```js
const path = require("path")
const fs = require("fs")

const files = [".bash_profile", "kjkjhh", ".npmrc"]

files.forEach(file => {
  try {
    const filePath = path.resolve(process.env.HOME, file)
    const data = fs.readFileSync(filePath, "utf-42")
    console.log("File data is", data)
  } catch (err) {
    // write to the log if we know what the error is
    if (err.code === "ENOENT") {
      console.log("File not found")
    } else {
      throw err // otherwise, throw an error if we don't know why the error happend, don't just catch all
    }
  }
})
```

## Promises and async patterns

```js
// even better than extracting readfile function from fs.promises
// more readable
const fs = require('fs').promises;

async function main() {
  const data = await fs.readFile(__filename);
  await fs.writeFile(__filename + '.copy', data);
  // More awaits here...
}

main();
console.log('TEST');
```

## event emitters

```js
// EventEmitter
emitter.on("data", msg => {
  console.log(msg);
});
emitter.emit("data", "Hello World");
```

```js
const EventEmitter = require("events")

const myEmitter = new EventEmitter()

// fire test event
setImmediate(() => {
  // or delay this call using the event loop
  // setImmediate will happen immediately after the end of the other stuff below
  myEmitter.emit("TEST_EVENT")
})

// subscribe to test event
// won't fire since the emit is above
myEmitter.on("TEST_EVENT", () => {
  console.log("TEST_EVENT was fired")
})
```

## Web

```js
// local http var now has all the methods defined on the public api of the http module
const http = require("http")

const requestListener = (req, res) => {
  // reqest object is of the type IncomingMessage
  //console.log(req) // long log output
  // console.dir(req, { depth: 0 }) // shorter output, only first level, no nested objects
//  console.dir(req.url) // shorter output, only first level, no nested objects

  // response object is of type ServerResponse
  console.dir(res, { depth: 0 })

  res.end("Hello Node\n")
  // .end is equivalent to writing
  // res.write("Hello World\n")
  // res.end()

  // req is a readable stream
  // res is a writeable stream
}

// functions are first class citizens in js because we can pass functions as arguments to other
// functions, otherwise called higher order functions
// this is a function reference being passed in, not calling the function like requestListener()
// which would pass the return value of requestListener
const server = http.createServer(requestListener)
// or like this
// const server = http.createServer()
// server.on("request", requestListener)
```

## Express

```js
const express = require("express")
// express const is now a function

const server = express()
// result of function is stored in server...function() gives a result or return value

server.get("/", (req, res) => {
  res.send("Hello Express") // automatically invokes .end
})

server.get("/about", (req, res) => {
  res.send("About...") // automatically invokes .end
})

server.listen(4243, () => {
  console.log("Express Server is running...")
})
```

Other popular web servers built with node:

- Koa
- Sails.js
- meteor.com

Templating:

- EJS
- Handlebars.js
- Pug

React and JSX work will together for templating. Works on server, not just front end.

## Operating System

**Modules: OS, fs, child_process**

Square brackets in fs commands indicate optional parameters.
fs.readFile and fs.writeFile use buffers which require more memory than fs.createReadStream and
fs.createWriteStream.

```js
const { spawn } = require('child_process');

// Print Working Directory
const pwd = spawn('pwd');
pwd.stdout.pipe(process.stdout);

// Read content of a file
const { HOME } = process.env;
const cat = spawn('cat', [`${HOME}/.bash_profile`]);
cat.stdout.pipe(process.stdout);

// List files
const ls = spawn('ls', ['-l', '.']);
ls.stdout.pipe(process.stdout);

// Use Shell Syntax
const shell = spawn('ls -al ~ | wc -l', { shell: true });
shell.stdout.pipe(process.stdout);
```
