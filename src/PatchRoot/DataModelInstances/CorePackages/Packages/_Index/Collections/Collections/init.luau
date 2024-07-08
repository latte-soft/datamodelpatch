local l_Parent_0 = script.Parent;
local v1 = require(script.Array);
local v2 = require(script.Map);
local v3 = require(script.Object);
local v4 = require(script.Set);
local v5 = require(script.WeakMap);
local v6 = require(script.inspect);
local _ = require(l_Parent_0.ES7Types);
return {
    Array = v1, 
    Object = v3, 
    Map = v2.Map, 
    coerceToMap = v2.coerceToMap, 
    coerceToTable = v2.coerceToTable, 
    Set = v4, 
    WeakMap = v5, 
    inspect = v6
};
