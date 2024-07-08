local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.LuaApp.Actions.SetBoundInputs);
local v9 = require(l_Modules_0.LuaApp.Actions.MaybeClearBoundInputs);
local v10 = v4.PureComponent:extend("BoundInputsUpdater");
v10.validateProps = v7.strictInterface({
    focusController = v7.table, 
    setBoundInputs = v7.callback, 
    maybeClearBoundInputs = v7.callback
});
v10.disconnectEvent = function(v11)
    if v11.disconnect ~= nil then
        v11.disconnect();
        v11.disconnect = nil;
    end;
end;
v10.subscribeEvent = function(v12)
    v12.disconnect = v12.props.focusController.subscribeToBoundInputsChanged(function(v13)
        if next(v13) ~= nil then
            v12.props.setBoundInputs(v13, v12.props.focusController);
        end;
    end);
    local v14 = v12.props.focusController.getBoundInputs();
    if next(v14) ~= nil then
        v12.props.setBoundInputs(v14, v12.props.focusController);
    end;
end;
v10.didMount = function(v15)
    v15:subscribeEvent();
end;
v10.render = function(_)
    return nil;
end;
v10.didUpdate = function(v17, v18)
    if v17.props.focusController ~= v18.focusController then
        v17:disconnectEvent();
        v17:subscribeEvent();
    end;
end;
v10.willUnmount = function(v19)
    v19:disconnectEvent();
    v19.props.maybeClearBoundInputs(v19.props.focusController);
end;
v10 = v6.connect(nil, function(v20)
    return {
        setBoundInputs = function(v21, v22)
            v20(v8(v21, v22));
        end, 
        maybeClearBoundInputs = function(v23)
            v20(v9(v23));
        end
    };
end)(v10);
return function(v24)
    return v5.withFocusController(function(v25)
        return v4.createElement(v10, v3.Dictionary.join(v24, {
            focusController = v25
        }));
    end);
end;
