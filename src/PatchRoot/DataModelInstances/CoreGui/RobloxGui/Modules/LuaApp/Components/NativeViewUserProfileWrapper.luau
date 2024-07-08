local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.NativeViewProfileWrapper);
local v4 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v5 = v2.PureComponent:extend("NativeViewUserProfileWrapper");
v5.render = function(v6)
    return v2.createElement(v3, {
        isVisible = v6.props.isVisible, 
        DisplayOrder = v6.props.DisplayOrder, 
        url = v4.user.profile({
            userId = v6.props.userId
        }), 
        onClose = v6.props.onClose
    });
end;
return v5;
