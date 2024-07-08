local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.llama);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.FriendsNetworking);
local v4 = require(l_Parent_0.NetworkingBlocking);
local v5 = require(script.Reducers.FriendsReducer);
local v6 = require(script.Actions);
local v7 = require(script.Selectors);
local v8 = require(script.Models);
local v9 = require(script.Enums);
return {
    config = function(v10)
        v10 = v1.Dictionary.join(v10, {
            friendsNetworking = v3.config({
                roduxNetworking = v2.mock()
            }), 
            networkingBlocking = v4.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function()
                return v5(v10);
            end, 
            Actions = v6(v10), 
            Selectors = v7(v10), 
            Models = v8, 
            Enums = v9
        };
    end
};
