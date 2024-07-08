local v0 = require(script.Reducers);
local v1 = require(script.Actions);
local v2 = require(script.Models);
local v3 = require(script.Enums);
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.RoduxNetworking);
local v7 = require(l_Parent_0.NetworkingSquads);
return {
    config = function(v8)
        v8 = v5.Dictionary.join(v8, {
            NetworkingSquads = v7.config({
                roduxNetworking = v6.mock()
            })
        });
        return {
            installReducer = function()
                return v0(v8);
            end, 
            Actions = v1, 
            Models = v2, 
            Enums = v3
        };
    end
};
