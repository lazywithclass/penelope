# penelope

Weaves and undoes source code checking the final result

### Use it

From the root folder of the project

```bash
$ # download all the projects that will be used as benchmark
$ npm run setup
$ # make sure all tests pass on them
$ npm test
$ # parse and unparse the source code
$ node index.js
$ # make sure tests still pass
$ npm test
```

If the last step succeeds it means that we are using a good
source code parser and AST code generator.
