local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_RoactFitComponents_0 = v6.RoactFitComponents;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withStyle_0 = v5.Style.withStyle;
local v11 = v3.PureComponent:extend("ListEntry");
v11.validateProps = v4.strictInterface({
    text = v4.string, 
    hasBullet = v4.boolean, 
    layoutOrder = v4.integer, 
    positionChangedCallback = v4.optional(v4.callback), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    forwardRef = v4.optional(v4.table)
});
v11.render = function(v12)
    return l_withStyle_0(function(v13)
        local l_Font_0 = v13.Font;
        local l_Theme_0 = v13.Theme;
        local l_Font_1 = l_Font_0.CaptionBody.Font;
        local v17 = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize;
        local v18 = l_Text_0.GetTextWidth("\226\128\162 ", l_Font_1, v17);
        return v3.createElement(l_RoactFitComponents_0.FitFrameVertical, {
            width = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            BackgroundTransparency = 1, 
            LayoutOrder = v12.props.layoutOrder, 
            [v3.Change.AbsolutePosition] = v12.props.positionChangedCallback, 
            NextSelectionLeft = v12.props.NextSelectionLeft, 
            NextSelectionRight = v12.props.NextSelectionRight, 
            NextSelectionUp = v12.props.NextSelectionUp, 
            NextSelectionDown = v12.props.NextSelectionDown, 
            [v3.Ref] = v12.props.forwardRef
        }, {
            Bullet = v12.props.hasBullet and v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v18, v17), 
                Text = "\226\128\162 ", 
                Font = l_Font_1, 
                TextSize = v17, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1
            }), 
            Text = v3.createElement(l_FitTextLabel_0, {
                width = UDim.new(1, not not v12.props.hasBullet and -v18 or 0), 
                BackgroundTransparency = 1, 
                Text = v12.props.text, 
                Font = l_Font_1, 
                TextSize = v17, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v3.forwardRef(function(v19, v20)
    return v3.createElement(v11, v2.Dictionary.join(v19, {
        forwardRef = v20
    }));
end);
