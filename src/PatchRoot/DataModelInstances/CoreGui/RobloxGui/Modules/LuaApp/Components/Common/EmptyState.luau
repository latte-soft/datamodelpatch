local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v10 = require(l_Modules_0.LuaApp.withLocalization);
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local v13 = l_Images_0["icons/status/oof_xlarge"];
local v14 = l_Images_0["icons/common/refresh"];
local v15 = v3.PureComponent:extend("EmptyState");
v15.validateProps = v4.interface({
    text = v4.string, 
    position = v4.optional(v4.UDim2), 
    size = v4.optional(v4.UDim2), 
    reloadAction = v4.optional(v4.callback)
});
v15.render = function(v16)
    return v10({
        emptyText = v16.props.text
    })(function(v17)
        return l_withStyle_0(function(v18)
            local l_emptyText_0 = v17.emptyText;
            local l_Font_0 = v18.Font.Body.Font;
            local v21 = v18.Font.BaseSize * v18.Font.Body.RelativeSize;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_emptyText_0, v21, l_Font_0, Vector2.new(1000, 1000));
            return v3.createElement("Frame", {
                Position = v16.props.position, 
                Size = v16.props.size, 
                BackgroundTransparency = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 0), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                EmptyIcon = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.fromOffset(l_IconSize_0.XLarge, l_IconSize_0.XLarge), 
                    Image = v13, 
                    BackgroundTransparency = 1, 
                    ImageColor3 = v18.Theme.IconDefault.Color, 
                    ImageTransparency = v18.Theme.IconDefault.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    LayoutOrder = 1
                }), 
                Padding1 = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 12), 
                    BackgroundTransparency = 1
                }), 
                Text = v3.createElement("TextLabel", {
                    Size = UDim2.fromOffset(l_l_TextService_0_TextSize_0.X, l_l_TextService_0_TextSize_0.Y), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = l_emptyText_0, 
                    Font = l_Font_0, 
                    TextSize = v21, 
                    TextColor3 = v18.Theme.TextMuted.Color, 
                    TextTransparency = v18.Theme.TextMuted.Transparency, 
                    TextWrapped = true, 
                    LayoutOrder = 3
                }), 
                Padding2 = v3.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1
                }), 
                ReloadButton = v16.props.reloadAction and v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    layoutOrder = 5, 
                    size = UDim2.fromOffset(312, 48), 
                    icon = v14, 
                    onActivated = v16.props.reloadAction
                })
            });
        end);
    end);
end;
return v15;
