local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.Packages.t);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_withStyle_0 = v4.Style.withStyle;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = v2.PureComponent:extend("CategorySubButton");
local l_NavCornerSize_0 = v11.NavCornerSize;
local l_NavButtonBorderSize_0 = v11.NavButtonBorderSize;
v12.validateProps = v8.strictInterface({
    title = v8.string, 
    width = v8.number, 
    layoutOrder = v8.number, 
    index = v8.number, 
    onSubButtonSelected = v8.callback, 
    parentButtonSelected = v8.boolean, 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    isClippedWhenParentUnselected = v8.optional(v8.boolean), 
    buttonRef = v8.table, 
    selectedSubButtonIndex = v8.optional(v8.number)
});
v12.renderWithProviders = function(v15, v16, v17)
    local v18 = nil;
    v18 = if not not v15.props.parentButtonSelected and v15.props.selectedSubButtonIndex then v15.props.selectedSubButtonIndex == v15.props.index else v15.props.index == 1;
    local l_Theme_0 = v16.Theme;
    local v20 = not not v15.props.parentButtonSelected and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
    local l_Font_0 = v16.Font;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v23 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v24 = not not v15.props.parentButtonSelected and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color;
    local v25 = {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_NavCornerSize_0)
        }), 
        InnerButton = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -l_NavButtonBorderSize_0 * 2, 1, -l_NavButtonBorderSize_0 * 2), 
            Position = UDim2.fromOffset(l_NavButtonBorderSize_0, l_NavButtonBorderSize_0), 
            Text = v15.props.title, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = if not v18 then l_Theme_0.BackgroundUIDefault.Color else v24, 
            TextSize = v23, 
            TextColor3 = if not v18 then v24 else l_Theme_0.BackgroundUIDefault.Color, 
            TextTransparency = v20, 
            Font = l_Font_1
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_NavCornerSize_0 - l_NavButtonBorderSize_0)
            })
        })
    };
    if not v15.props.isClippedWhenParentUnselected or v15.props.parentButtonSelected then
        return v2.createElement(l_Focusable_0.TextButton, {
            Size = UDim2.new(0, v15.props.width, 1, -4), 
            LayoutOrder = v15.props.layoutOrder, 
            [v2.Event.Activated] = function()
                v15.props.onSubButtonSelected(v15.props.index);
            end, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v24, 
            Text = "", 
            SelectionImageObject = v17(l_CursorKind_0.NavHighlight), 
            NextSelectionRight = v15.props.NextSelectionRight, 
            NextSelectionLeft = v15.props.NextSelectionLeft, 
            [v2.Ref] = v15.props.buttonRef
        }, v25);
    else
        return v2.createElement("TextButton", {
            Size = UDim2.new(0, v15.props.width, 1, -4), 
            LayoutOrder = v15.props.layoutOrder, 
            [v2.Event.Activated] = function()
                v15.props.onSubButtonSelected(v15.props.index);
            end, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v24, 
            Text = "", 
            [v2.Ref] = v15.props.buttonRef
        }, v25);
    end;
end;
v12.render = function(v26)
    return l_withStyle_0(function(v27)
        return l_withSelectionCursorProvider_0(function(v28)
            return v26:renderWithProviders(v27, v28);
        end);
    end);
end;
return (v3.connect(function(v29, _)
    return {
        selectedSubButtonIndex = v29.AvatarExperience.AvatarEditor.Categories.subButton
    };
end)(v12));
