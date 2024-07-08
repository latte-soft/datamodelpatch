local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.mockSerializer);
local l_plugins_0 = require(l_Parent_1.PrettyFormat).plugins;
local v5 = {
    v3, 
    l_plugins_0.AsymmetricMatcher, 
    l_plugins_0.ReactElement, 
    l_plugins_0.ReactTestComponent, 
    l_plugins_0.RobloxInstance
};
local v6 = l_Array_0.from(v5);
return {
    addSerializer = function(v7)
        table.insert(v5, 1, v7);
    end, 
    getSerializers = function()
        return v5;
    end, 
    resetSerializers = function()
        v5 = l_Array_0.from(v6);
    end
};
