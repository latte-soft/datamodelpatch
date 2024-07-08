local v0 = require(script:FindFirstAncestor("ShareLinkInvalidModal").dependencies);
local l_Roact_0 = v0.Roact;
local l_RoactNavigation_0 = v0.RoactNavigation;
local l_RoactRodux_0 = v0.RoactRodux;
local l_Dash_0 = v0.Dash;
local l_t_0 = v0.t;
local v6 = require(script.Parent.ShareLinkInvalidModal);
local v7 = l_Roact_0.Component:extend("ShareLinkInvalidModalContainer");
v7.validateProps = l_t_0.interface({
    navigation = l_t_0.table, 
    closeModal = l_t_0.callback
});
v7.init = function(v8)
    v8.closeModal = function()
        local l_props_0 = v8.props;
        l_props_0.closeModal();
        l_props_0.navigation.pop();
    end;
end;
v7.render = function(v10)
    return l_Roact_0.createElement(v6, l_Dash_0.join(v10.props, {
        closeModal = v10.closeModal
    }));
end;
return l_RoactNavigation_0.withNavigation((l_RoactRodux_0.connect(function(v11)
    return {
        screenSize = v11.ScreenSize
    };
end)(v7)));
