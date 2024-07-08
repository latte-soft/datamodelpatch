return require(script.Parent.Parent.LuauPolyfill).Object.assign({
    Object = require(script.Object)
}, require(script.makeIntervalImpl)(delay));
