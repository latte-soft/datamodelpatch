local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local v7 = v2.PureComponent:extend("AuthSystemPrimaryButton");
v7.render = function(v8)
    local l_props_0 = v8.props;
    l_props_0 = v3.Dictionary.join(l_props_0, {
        forwardRef = v3.None, 
        [v2.Ref] = l_props_0.forwardRef
    });
    return l_withStyle_0(function(v10)
        local v11 = {
            Color = v10.Theme.SystemPrimaryDefault.Color, 
            Transparency = v10.Theme.SystemPrimaryDefault.Transparency, 
            OnPressTransparency = 0.5, 
            DisabledTransparency = 0.5, 
            Text = {
                Color = v10.Theme.SystemPrimaryContent.Color, 
                Transparency = v10.Theme.SystemPrimaryContent.Transparency
            }, 
            Border = {
                Hidden = false, 
                Transparency = 1
            }
        };
        local v12 = "Header2";
        if not (not v6() or not v8.props.fontStyle) then
            v12 = v8.props.fontStyle;
        end;
        return v2.createElement(v4, v3.Dictionary.join(l_props_0, {
            Font = v10.Font[v12].Font, 
            TextSize = if not v8.props.TextSize then v10.Font.BaseSize * v10.Font[v12].RelativeSize else v8.props.TextSize, 
            themeSettings = v11
        }));
    end);
end;
return v2.forwardRef(function(v13, v14)
    return v2.createElement(v7, v3.Dictionary.join(v13, {
        forwardRef = v14
    }));
end);
