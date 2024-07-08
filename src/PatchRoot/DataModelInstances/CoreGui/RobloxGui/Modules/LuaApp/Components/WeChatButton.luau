local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.LuaApp.Components.GenericIconTextButton);
local l_Colors_0 = require(l_CorePackages_0.Workspace.Packages.Style).Colors;
local v6 = UDim2.new(0, 37, 0, 37);
local v7 = v2.PureComponent:extend("WeChatButton");
v7.render = function(v8)
    local l_props_0 = v8.props;
    return v2.createElement(v4, v3.Dictionary.join(l_props_0, {
        iconImage = "rbxasset://textures/ui/LuaApp/graphic/Auth/wechatlogo.png", 
        iconSize = v6, 
        leftIconEnabled = true, 
        themeSettings = {
            Color = l_props_0.Color or l_Colors_0.Green, 
            Transparency = l_props_0.Transparency or 0, 
            OnPressTransparency = 0.5, 
            DisabledTransparency = 0.5, 
            DisabledColor = l_Colors_0.White, 
            Text = {
                Color = l_Colors_0.White, 
                Transparency = 0
            }, 
            Border = {
                Hidden = true, 
                Transparency = 1
            }
        }, 
        iconRightPadding = 10
    }));
end;
return v7;
