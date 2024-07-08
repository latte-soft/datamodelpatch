local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = v2.PureComponent:extend(script.Name);
v5.defaultProps = {
    textPadding = 8
};
v5.render = function(v6)
    local l_textKey_0 = v6.props.textKey;
    local l_layoutOrder_0 = v6.props.layoutOrder;
    local l_onActivatedCallback_0 = v6.props.onActivatedCallback;
    local l_isPrimaryLink_0 = v6.props.isPrimaryLink;
    local l_textPadding_0 = v6.props.textPadding;
    return l_withStyle_0(function(v12)
        return v4({
            linkText = l_textKey_0
        })(function(v13)
            local v14 = not not l_isPrimaryLink_0 and v12.Font.SubHeader1 or v12.Font.CaptionBody;
            local v15 = not not l_onActivatedCallback_0 and v12.Theme.SystemPrimaryDefault.Color or v12.Theme.UIDefault.Color;
            local v16 = v14.RelativeSize * v12.Font.BaseSize;
            return v2.createElement("TextButton", {
                BackgroundTransparency = 1, 
                RichText = true, 
                Text = string.format("<u>%s</u>", v13.linkText), 
                Size = UDim2.new(1, 0, 0, v16 + l_textPadding_0), 
                Font = v14.Font, 
                TextColor3 = v15, 
                TextTransparency = v12.Theme.TextDefault.Transparency, 
                TextSize = v16, 
                LayoutOrder = l_layoutOrder_0, 
                [v2.Event.Activated] = l_onActivatedCallback_0
            });
        end);
    end);
end;
return v5;
