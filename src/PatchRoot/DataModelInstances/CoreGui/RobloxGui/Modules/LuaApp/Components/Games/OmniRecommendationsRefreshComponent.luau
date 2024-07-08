local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v7 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v8 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v13 = v4.PureComponent:extend("OmniRecommendationsRefreshComponent");
v13.init = function(v14)
    v14.steppedCallback = function()
        if v14.props.retrievalStatus[v14.props.pageType] ~= v7.Done then
            return ;
        else
            local v15 = tick();
            if v14.props.refreshTime then
                local v16 = v14.props.refreshTime[v14.props.pageType];
                if not (v16 ~= nil) or v15 < v16 then
                    return ;
                else
                    v14.props.refresh(v14.props.networking, v14.props.omniRecommendationsRequest, v14.props.pageType, v3.OmniRecommendationsRequestIntent.AutoRefresh);
                    return ;
                end;
            else
                return ;
            end;
        end;
    end;
end;
v13.render = function(v17)
    return v4.createElement(v8, {
        event = l_RunService_0.stepped, 
        callback = v17.steppedCallback
    });
end;
return l_RoactServices_0.connect({
    networking = v9, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
})((v5.connect(function(v18, _)
    return {
        refreshTime = v18.OmniRecommendationsRefreshTime, 
        retrievalStatus = v18.RequestsStatus.OmniRecommendationsRetrievalStatus
    };
end, function(v20)
    return {
        refresh = function(v21, v22, v23, v24)
            return v20(v6(v21, v22, v23, nil, nil, v24));
        end
    };
end)(v13)));
