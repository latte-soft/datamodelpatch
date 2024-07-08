local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_Dash_0 = v1.Dash;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v7 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v9 = require(l_Parent_0.Common.ProfileScreens);
local v10 = require(script.Parent.UnableToJoinExperienceModal);
local v11 = require(script.Parent.unableToJoinExperienceMapStateToProps);
local v12 = l_Roact_0.Component:extend("UnableToJoinExperienceModalContainer");
v12.init = function(v13)
    v13.closeModal = function()
        v13.props.navigation.pop();
    end;
    v13.openGameDetailsPeekView = function()
        local l_props_0 = v13.props;
        l_props_0.navigateToLuaAppPages[v9.GameDetailsPeekView](l_props_0.navigation.getParam("universeId"), {
            mountAsFullView = true, 
            showBackButton = true, 
            onPeekViewClosed = l_props_0.peekViewProps.onPeekViewClosed
        });
    end;
end;
v12.render = function(v15)
    return l_Roact_0.createElement(v10, l_Dash_0.join(v15.props, {
        closeModal = v15.closeModal, 
        openGameDetailsPeekView = v15.openGameDetailsPeekView
    }));
end;
return l_compose_0(v7.connect(function(v16)
    return {
        profileUserId = v16.profileUserId, 
        navigateToLuaAppPages = v16.navigateToLuaAppPages, 
        peekViewProps = v16.peekViewProps
    };
end), l_RoactRodux_0.connect(v11, nil))(v12);
