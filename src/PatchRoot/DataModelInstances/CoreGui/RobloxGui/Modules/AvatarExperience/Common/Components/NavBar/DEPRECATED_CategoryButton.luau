local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v5.Style.withStyle;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NewItemNotification);
local v12 = v3.PureComponent:extend("CategoryButton");
v12.renderWithLocalized = function(v13, v14)
    return l_withStyle_0(function(v15)
        local l_Font_0 = v15.Font;
        local l_Theme_0 = v15.Theme;
        local l_isSelected_0 = v13.props.isSelected;
        local l_Font_1 = l_Font_0.Header2.Font;
        local v20 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v21 = l_Text_0.GetTextWidth(v14.title, l_Font_1, v20);
        local v22 = not not l_isSelected_0 and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color;
        local v23 = not not l_isSelected_0 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
        local v24 = v21 + 20;
        local l_hasNewItemNotification_0 = v13.props.hasNewItemNotification;
        local l_forwardRef_0 = v13.props.forwardRef;
        local l_frameRef_0 = v13.props.frameRef;
        return l_withSelectionCursorProvider_0(function(v28)
            return v3.createElement("Frame", {
                Size = UDim2.new(0, v24, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v13.props.layoutOrder, 
                [v3.Ref] = l_frameRef_0
            }, {
                Button = v3.createElement(l_Focusable_0.TextButton, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Text = v14.title, 
                    TextSize = v20, 
                    TextColor3 = v22, 
                    TextTransparency = v23, 
                    Font = l_Font_1, 
                    [v3.Event.Activated] = function()
                        v13.props.onActivate(v13.props.categoryIndex);
                    end, 
                    [v3.Ref] = l_forwardRef_0, 
                    NextSelectionLeft = v13.props.NextSelectionLeft, 
                    NextSelectionRight = v13.props.NextSelectionRight, 
                    NextSelectionUp = v13.props.NextSelectionUp, 
                    NextSelectionDown = v13.props.NextSelectionDown, 
                    SelectionImageObject = v28(l_CursorKind_0.NavHighlight)
                }), 
                NewItemNotification = l_hasNewItemNotification_0 and v3.createElement(v11, {
                    isSelected = l_isSelected_0
                })
            });
        end);
    end);
end;
v12.render = function(v29)
    return l_withLocalization_0({
        title = v29.props.categoryTitle
    })(function(v30)
        return v29:renderWithLocalized(v30);
    end);
end;
return v3.forwardRef(function(v31, v32)
    return v3.createElement(v12, v2.Dictionary.join(v31, {
        forwardRef = v32
    }));
end);
