local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = require(l_Parent_0.ProfileContext);
local v5 = require(l_Parent_0.Common.ProfileScreens);
local v6 = require(l_Parent_0.Common.ContextPropsTypes);
local v7 = require(script.Parent.ViewUserProfile);
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v9 = require(l_Parent_0.Analytics);
local v10 = l_Roact_0.PureComponent:extend("ViewUserProfileContainer");
v10.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    navigateToLuaAppPages = v6.validateNavigateToLuaAppPages, 
    profileUserId = l_t_0.string, 
    analytics = l_t_0.table, 
    navigationParams = l_t_0.optional(l_t_0.table)
});
v10.init = function(v11)
    v11.onActivated = function()
        local l_props_0 = v11.props;
        l_props_0.analytics:buttonClick(v9.Enums.ButtonClickEvents.ViewPlayerProfile, {
            recommendationSessionId = l_props_0.navigationParams.recommendationSessionId, 
            absolutePosition = l_props_0.navigationParams.absolutePosition, 
            isHomePageCarousel = l_props_0.navigationParams.isHomePageCarousel, 
            isRecommendation = l_props_0.navigationParams.isRecommendation, 
            recommendationContextType = l_props_0.navigationParams.recommendationContextType, 
            recommendationRank = l_props_0.navigationParams.recommendationRank, 
            source = l_props_0.navigationParams.source
        });
        l_props_0.navigateToLuaAppPages[v5.ViewUserProfile](l_props_0.profileUserId);
    end;
end;
v10.render = function(v13)
    return l_Roact_0.createElement(v7, {
        onActivated = v13.onActivated, 
        layoutOrder = v13.props.layoutOrder
    });
end;
return l_compose_0(v4.connect(function(v14)
    return {
        navigateToLuaAppPages = v14.navigateToLuaAppPages, 
        profileUserId = v14.profileUserId, 
        navigationParams = v14.navigationParams
    };
end), v9.connect(function(v15)
    return {
        analytics = v15
    };
end))(v10);
