local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.installReducer);
local v5 = require(l_Parent_0.App.Networking);
local v6 = require(l_Parent_0.installReducer.ScreenSize);
local v7 = require(l_Parent_0.installReducer.ServerType);
local v8 = {};
return function(v9)
    return v3.Store.new(v3.combineReducers({
        Games = v5.RoduxGames.installReducer(), 
        NetworkStatus = v5.RoduxNetworking.installReducer(), 
        Screenshots = v4(), 
        ScreenSize = v6, 
        ServerType = v7
    }), v2.joinDeep(v8, v9 or {}), {
        v3.thunkMiddleware
    });
end;
