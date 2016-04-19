var fs = require('fs'),
    path = require('path'),
    weaveUndo = require('./lib/weave-undo');


function getDirectories(src) {
  return fs.readdirSync(src).filter(function(file) {
    return fs.statSync(path.join(src, file)).isDirectory();
  });
}

getDirectories('modules').forEach((module) => {
  weaveUndo(path.join('modules', module), function() {

  });
});
