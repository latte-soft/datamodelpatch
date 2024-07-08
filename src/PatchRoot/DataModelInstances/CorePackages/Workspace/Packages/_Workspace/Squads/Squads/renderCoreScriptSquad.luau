local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_React_0 = v2.React;
local l_RoactRodux_0 = v2.RoactRodux;
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local v8 = require(l_script_FirstAncestor_0.SquadEventReceiver);
local v9 = require(l_script_FirstAncestor_0.installReducer);
local v10 = {};
v10.__index = v10;
v10.new = function()
    local v11 = setmetatable({}, v10);
    v11.store = l_Rodux_0.Store.new(l_Rodux_0.combineReducers({
        [v7.RODUX_KEY] = v9()
    }), nil, {
        l_Rodux_0.thunkMiddleware
    });
    v11.root = l_React_0.createElement("Folder", {}, {
        StoreProvider = l_React_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = v11.store
        }, {
            SquadEventReceiver = l_React_0.createElement(v8)
        })
    });
    v11.element = l_Roact_0.mount(v11.root, l_CoreGui_0, "Squad");
    return v11;
end;
return v10;
