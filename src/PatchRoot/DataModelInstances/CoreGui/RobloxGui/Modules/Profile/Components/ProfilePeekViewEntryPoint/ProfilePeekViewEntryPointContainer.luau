local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_Dash_0 = v1.Dash;
local l_memoize_0 = v1.memoize;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local _ = require(l_Parent_0.Common.ProfileTypes);
local v10 = require(l_Parent_0.Analytics);
local v11 = require(l_Parent_0.Navigator);
local v12 = require(script.Parent.ProfilePeekViewEntryPoint);
local v13 = require(script.Parent.profilePeekViewEntryPointMapStateToProps);
local v14 = require(script.Parent.profilePeekViewEntryPointMapDispatchToProps);
local v15 = l_Roact_0.PureComponent:extend("ProfilePeekViewEntryPointContainer");
v15.init = function(v16)
    local l_props_0 = v16.props;
    v16.fetchProfilePageData = function()
        return l_props_0.fetchProfilePageData(l_props_0.profileUserId);
    end;
    v16.resetProfilePageDataStatus = function()
        return l_props_0.resetProfilePageDataStatus(l_props_0.profileUserId);
    end;
    v16.getAnalytics = l_memoize_0(function(v18, v19)
        local l_props_1 = v16.props;
        return v10.Class.new({
            profileUserId = v19, 
            localUserId = v18, 
            eventIngestService = l_props_1.eventIngestService, 
            sessionService = l_props_1.sessionService, 
            sessionType = l_props_1.sessionType, 
            analyticsProps = l_props_1.analyticsProps
        });
    end);
end;
v15.render = function(v21)
    return l_Roact_0.createElement(v12, l_Dash_0.join(v21.props, {
        fetchProfilePageData = v21.fetchProfilePageData, 
        resetProfilePageDataStatus = v21.resetProfilePageDataStatus, 
        getAnalytics = v21.getAnalytics, 
        eventIngestService = l_Dash_0.None, 
        sessionType = l_Dash_0.None, 
        sessionService = l_Dash_0.None
    }));
end;
v15 = l_compose_0(l_RoactRodux_0.connect(v13, v14))(v15);
v15.router = v11.router;
return v15;
