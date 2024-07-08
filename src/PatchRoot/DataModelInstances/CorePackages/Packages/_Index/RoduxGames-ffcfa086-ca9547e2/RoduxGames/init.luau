local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.RoduxNetworking);
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.NetworkingGames);
local v4 = require(script.Reducers);
local v5 = require(script.Actions);
local v6 = require(script.Models);
local v7 = require(script.Enums);
return {
    config = function(v8)
        v8 = v2.join(v8, {
            networkingGames = v3.config({
                roduxNetworking = v1.mock()
            })
        });
        return {
            installReducer = function()
                return v4(v8);
            end, 
            Actions = v5, 
            Models = v6, 
            Enums = v7
        };
    end
};
