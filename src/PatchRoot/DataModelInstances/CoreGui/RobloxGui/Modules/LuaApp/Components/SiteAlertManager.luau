local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_Modules_0.LuaApp.Thunks.ApiFetchSiteMessage);
local v8 = require(l_Modules_0.LuaApp.Actions.RefreshSiteAlertInfo);
local v9 = v2.PureComponent:extend("SiteAlertManager");
v9.render = function(_)
end;
v9.didUpdate = function(v11, v12)
    if not (v12.updateRequested or not v11.props.updateRequested) then
        local v13 = os.time();
        local l_messageTime_0 = v11.props.messageTime;
        if l_messageTime_0 and v13 - l_messageTime_0 < v11.props.alertRateLimit then
            v11.props.dismissRefresh();
            return ;
        else
            v11.props.refresh(v11.props.networking);
        end;
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v15, _)
    return {
        alertRateLimit = v15.getAlertRateLimit()
    };
end)((l_RoactServices_0.connect({
    networking = v5
})((v3.connect(function(v17, _)
    return {
        messageTime = v17.SiteMessage.timestamp, 
        updateRequested = v17.SiteMessage.updateRequested
    };
end, function(v19)
    return {
        refresh = function(v20)
            v19(v7(v20));
        end, 
        dismissRefresh = function()
            v19(v8({
                updateRequested = false
            }));
        end
    };
end)(v9))))));
