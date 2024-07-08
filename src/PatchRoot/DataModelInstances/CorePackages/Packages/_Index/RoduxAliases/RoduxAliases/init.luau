local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.llama);
local v3 = require(l_Parent_0.RoduxNetworking);
local v4 = require(l_Parent_0.AliasNetworking);
local v5 = require(l_script_0.Reducers.AliasesReducer);
local v6 = require(l_script_0.Actions);
local v7 = require(l_script_0.Selectors);
local _ = require(l_script_0.RoduxAliasesTypes);
return {
    config = function(v9)
        v9 = v2.Dictionary.join(v9, {
            aliasNetworking = v4.config({
                roduxNetworking = v3.mock()
            })
        });
        return {
            installReducer = function()
                return v5(v9);
            end, 
            Actions = v6, 
            Selectors = v7(v9)
        };
    end
};
