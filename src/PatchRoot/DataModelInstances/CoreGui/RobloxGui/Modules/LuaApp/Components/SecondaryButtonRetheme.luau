local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.GenericTextButton);
local v5 = v2.PureComponent:extend("SecondaryButtonRetheme");
v5.render = function(v6)
    local l_props_0 = v6.props;
    l_props_0 = v1.Dictionary.join(l_props_0, {
        forwardRef = v1.None, 
        [v2.Ref] = l_props_0.forwardRef
    });
    return l_withStyle_0(function(v8)
        return v2.createElement(v4, v1.Dictionary.join(l_props_0, {
            themeSettings = {
                Transparency = 1, 
                OnPressTransparency = 0.5, 
                DisabledTransparency = 0.5, 
                Text = {
                    Color = v8.Theme.SecondaryContent.Color, 
                    Transparency = v8.Theme.SecondaryContent.Transparency
                }, 
                Border = {
                    Hidden = false, 
                    Color = v8.Theme.SecondaryDefault.Color, 
                    Transparency = v8.Theme.SecondaryDefault.Transparency
                }
            }, 
            Font = v8.Font.Header2.Font, 
            TextSize = if not v6.props.TextSize then v8.Font.BaseSize * v8.Font.Header2.RelativeSize else v6.props.TextSize
        }));
    end);
end;
return v2.forwardRef(function(v9, v10)
    return v2.createElement(v5, v1.Dictionary.join(v9, {
        forwardRef = v10
    }));
end);
