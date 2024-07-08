local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v6 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v7 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = v3.PureComponent:extend("TokenRefreshComponent");
v10.init = function(v11)
    v11.steppedCallback = function()
        local l_sortToRefresh_0 = v11.props.sortToRefresh;
        local v13 = v11.props.nextTokenRefreshTime[l_sortToRefresh_0];
        if v11.props.GameSortTokenFetchingStatus[l_sortToRefresh_0] ~= v6.Done then
            return ;
        else
            if v13 < tick() then
                v11.props.refresh(v11.props.networking, l_sortToRefresh_0):catch(function()
                end);
            end;
            return ;
        end;
    end;
end;
v10.render = function(v14)
    return v3.createElement(v7, {
        event = l_RunService_0.stepped, 
        callback = v14.steppedCallback
    });
end;
return l_RoactServices_0.connect({
    networking = v8
})((v4.connect(function(v15, _)
    return {
        nextTokenRefreshTime = v15.NextTokenRefreshTime, 
        GameSortTokenFetchingStatus = v15.RequestsStatus.GameSortTokenFetchingStatus
    };
end, function(v17)
    return {
        refresh = function(v18, v19)
            return v17(v5(v18, v19, nil));
        end
    };
end)(v10)));
