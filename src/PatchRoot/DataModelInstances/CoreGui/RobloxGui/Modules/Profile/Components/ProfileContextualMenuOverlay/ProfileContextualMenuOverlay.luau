local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = require(l_Parent_0.Utils.onClickWithToast);
local v5 = require(l_Parent_0.Components.ProfileContextualMenu);
local v6 = l_Roact_0.PureComponent:extend("ProfileContextualMenuOverlay");
v6.validateProps = l_t_0.strictInterface({
    navigation = l_t_0.any, 
    menuElement = l_t_0.optional(l_t_0.table)
});
v6.defaultProps = {
    menuElement = v5
};
v6.init = function(v7)
    v7.onDismiss = function(v8)
        local l_props_0 = v7.props;
        l_props_0.navigation.getParam("onCloseContextualMenu")();
        if not v8 then
            l_props_0.navigation.goBack();
        end;
    end;
    v7.onClickWithToast = function(v10)
        return v4(v7.props.navigation, v10);
    end;
end;
v6.render = function(v11)
    return l_Roact_0.createElement(v11.props.menuElement, {
        onDismiss = v11.onDismiss, 
        onClickWithToast = v11.onClickWithToast, 
        navigation = v11.props.navigation
    });
end;
return v6;
