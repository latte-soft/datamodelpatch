local v0 = require(script.Reducers);
local v1 = require(script.Actions);
local v2 = require(script.Models);
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.RoduxNetworking);
local v6 = require(l_Parent_0.FriendsNetworking);
local v7 = require(l_Parent_0.UsersNetworking);
local v8 = require(script.roduxUsersTypes);
return {
    config = function(v9)
        v9 = v4.Dictionary.join(v9, {
            usersNetworking = v7.config({
                roduxNetworking = v5.mock()
            }), 
            friendsNetworking = v6.config({
                roduxNetworking = v5.mock()
            })
        });
        return {
            installReducer = function()
                return v0(v9);
            end, 
            Actions = v1, 
            Models = v2, 
            roduxUsersTypes = v8
        };
    end
};
