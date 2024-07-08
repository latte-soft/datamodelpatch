local v0 = require(script.Actions);
local v1 = require(script.Enums);
local v2 = require(script.Reducers);
local v3 = require(script.Models);
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.RoduxNetworking);
local v7 = require(l_Parent_0.NetworkingCall);
return {
    config = function(v8)
        v8 = v5.Dictionary.join(v8, {
            NetworkingCall = v7.config({
                roduxNetworking = v6.mock()
            })
        });
        return {
            installReducer = function()
                return v2(v8);
            end, 
            Actions = v0, 
            Enums = v1, 
            Models = v3
        };
    end
};
