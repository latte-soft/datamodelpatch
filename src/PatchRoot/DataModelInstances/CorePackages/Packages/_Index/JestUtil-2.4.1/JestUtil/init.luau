local l_Object_0 = require(script.Parent.LuauPolyfill).Object;
local v1 = {
    clearLine = require(script.clearLine).default, 
    createDirectory = require(script.createDirectory).default, 
    ErrorWithStack = require(script.ErrorWithStack).default, 
    installCommonGlobals = require(script.installCommonGlobals)().default, 
    isInteractive = require(script.isInteractive).default, 
    isPromise = require(script.isPromise).default, 
    setGlobal = require(script.setGlobal).default, 
    deepCyclicCopy = require(script.deepCyclicCopy).default, 
    convertDescriptorToString = require(script.convertDescriptorToString).default
};
local v2 = require(script.specialChars);
l_Object_0.assign(v1, v2);
v1.ARROW = v2.ARROW;
v1.ICONS = v2.ICONS;
v1.CLEAR = v2.CLEAR;
v1.globsToMatcher = require(script.globsToMatcher).default;
local v3 = require(script.preRunMessage);
l_Object_0.assign(v1, v3);
v1.print = v3.print;
v1.remove = v3.remove;
v1.pluralize = require(script.pluralize).default;
v1.formatTime = require(script.formatTime).default;
return v1;
