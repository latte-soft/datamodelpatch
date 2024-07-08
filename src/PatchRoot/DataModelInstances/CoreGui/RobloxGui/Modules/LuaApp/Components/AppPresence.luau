local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactRodux);
local v7 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v8 = require(l_Modules_0.LuaApp.ArgCheck);
local v9 = require(l_Modules_0.LuaApp.FlagSettings);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.LuaApp.Thunks.PostRegisterAppPresence);
local v13 = v9.LuaAppPresencePollingIntervalInSeconds();
local v14 = v5.PureComponent:extend("AppPresence");
v14.init = function(v15)
    v15._presenceTimer = tick() + v13;
    v15._anyInputReceived = false;
    v15.inputBeganCallback = function()
        if v15._anyInputReceived == false then
            v15._anyInputReceived = true;
        end;
    end;
    v15.renderSteppedCallback = function(v16)
        local v17 = tick();
        if v15._presenceTimer < v17 and v13 > 0 then
            v15._presenceTimer = v17 + v13;
            if not (not (v16 < v13) or not v15._anyInputReceived) then
                local l_locationId_0 = v15.props.locationId;
                v8.isNonEmptyString(l_locationId_0, "AppPresence.locationId");
                v15.props.registerAppPresence(v15.props.networking, l_locationId_0);
            end;
            v15._anyInputReceived = false;
        end;
    end;
end;
v14.render = function(v19)
    if not l_RunService_0:IsStudio() then
        return v5.createElement("Folder", {}, {
            inputBeganListener = v5.createElement(v7, {
                event = l_UserInputService_0.InputBegan, 
                callback = v19.inputBeganCallback
            }), 
            renderSteppedListener = v5.createElement(v7, {
                event = l_RunService_0.renderStepped, 
                callback = v19.renderSteppedCallback
            })
        });
    else
        return nil;
    end;
end;
return l_RoactServices_0.connect({
    networking = v11
})((v6.connect(function(v20, _)
    local v22 = v20.Navigation.history[#v20.Navigation.history];
    return {
        locationId = v22[#v22].name or "Unknown"
    };
end, function(v23)
    return {
        registerAppPresence = function(v24, v25)
            return v23(v12(v24, v25));
        end
    };
end)(v14)));
