local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_UniversalAppPolicy_0 = v1.UniversalAppPolicy;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v7 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v9 = require(script.Parent.ProfileCard);
local v10 = require(script.Parent.profileCardMapStateToProps);
local v11 = require(script.Parent.profileCardMapDispatchToProps);
local v12 = l_Roact_0.PureComponent:extend("ProfileCardContainer");
v12.init = function(v13)
    local l_props_0 = v13.props;
    v13.fetchProfilePageData = function()
        return l_props_0.fetchProfilePageData(l_props_0.profileUserId);
    end;
end;
v12.render = function(v15)
    local l_props_1 = v15.props;
    return l_Roact_0.createElement(v9, {
        fetchProfilePageData = v15.fetchProfilePageData, 
        profileUserId = l_props_1.profileUserId, 
        peekViewProps = l_props_1.peekViewProps, 
        profilePageDataStatus = l_props_1.profilePageDataStatus, 
        isDeleted = l_props_1.isDeleted, 
        isCurrentlyWearingAnything = l_props_1.isCurrentlyWearingAnything, 
        width = l_props_1.width, 
        height = l_props_1.height, 
        wideMode = l_props_1.wideMode, 
        description = l_props_1.description, 
        supportsWebViews = l_props_1.supportsWebViews, 
        navigation = l_props_1.navigation
    });
end;
return l_compose_0(l_RoactRodux_0.connect(v10, v11), v7.connect(function(v17)
    return {
        profileUserId = v17.profileUserId, 
        peekViewProps = v17.peekViewProps, 
        wideMode = v17.wideMode, 
        profileType = v17.profileType
    };
end), l_UniversalAppPolicy_0.connect(function(v18)
    return {
        supportsWebViews = v18.getWebViewSupport()
    };
end))(v12);
