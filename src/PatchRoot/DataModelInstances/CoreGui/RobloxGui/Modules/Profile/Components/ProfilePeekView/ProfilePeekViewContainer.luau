local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Dash_0 = v1.Dash;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v6 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v8 = require(l_Parent_0.Utils.onClickWithToast);
local v9 = require(script.Parent.ProfilePeekViewUIWrapper);
local v10 = require(script.Parent.profilePeekViewMapStateToProps);
local v11 = require(script.Parent.profilePeekViewMapDispatchToProps);
local v12 = l_Roact_0.PureComponent:extend("ProfilePeekViewContainer");
v12.init = function(v13)
    local l_props_0 = v13.props;
    v13.onClickWithToast = function(v15)
        return v8(l_props_0.navigation, v15);
    end;
end;
v12.render = function(v16)
    return l_Roact_0.createElement(v9, l_Dash_0.join(v16.props, {
        onClickWithToast = v16.onClickWithToast
    }));
end;
return l_compose_0(v6.connect(function(v17)
    return {
        profileType = v17.profileType, 
        profileUserId = v17.profileUserId, 
        peekViewProps = v17.peekViewProps, 
        contactProps = v17.contactProps, 
        wideMode = v17.wideMode
    };
end), l_RoactRodux_0.connect(v10, v11))(v12);
