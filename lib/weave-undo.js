var acorn = require('acorn'),
    escodegen = require('escodegen'),
    walk = require('walk'),
    fs = require('fs'),
    path = require('path');


function weaveUndo(folder, cb) {
  var walker = walk.walk(folder, { filters: ['node_modules'] });
  walker.on('file', function (root, fileStats, next) {
    var filePath = path.join(root, fileStats.name);
    if (!filePath.endsWith('.js')) return next();

    var content = fs.readFileSync(filePath, 'utf8');
    try {
      var contentAfterParseUnparse = asString(asAst(content));
      fs.writeFileSync(filePath, contentAfterParseUnparse, 'utf8');
    } catch(e) {
      if (!isShabangException(e)) throw e;
    }
    next();
  });

  walker.on("end", cb);
}

function isShabangException(e) {
  return e.name === 'SyntaxError' &&
    e.message === 'Unexpected character \'#\' (1:0)';
}

function asAst(codeAsString) {
  return acorn.parse(codeAsString, { ranges: true });
}

function asString(ast) {
  return escodegen.generate(ast);
}

module.exports = weaveUndo;
