local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.NetworkingPresence);
local v4 = require(script.Reducer);
local v5 = require(script.Actions);
local v6 = require(script.Selectors);
local v7 = require(script.Models);
local v8 = require(script.Enums);
return {
    config = function(v9)
        v9 = v1.Dictionary.join(v9, {
            presenceNetworking = v3.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function()
                return v4(v9);
            end, 
            Actions = v5(v9), 
            Selectors = v6(v9), 
            Models = v7, 
            Enums = v8
        };
    end
};
