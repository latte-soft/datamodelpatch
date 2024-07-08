local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.mockSerializer);
local _ = require(l_Parent_1.PrettyFormat);
local l_plugins_0 = require(l_Parent_1.PrettyFormat).plugins;
local v5 = {
    v2, 
    l_plugins_0.AsymmetricMatcher, 
    l_plugins_0.ReactElement, 
    l_plugins_0.ReactTestComponent, 
    l_plugins_0.RobloxInstance
};
return {
    addSerializer = function(v6)
        table.insert(v5, 1, v6);
    end, 
    getSerializers = function()
        return v5;
    end
};
