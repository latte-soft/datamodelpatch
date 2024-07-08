local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local l_RoactFitComponents_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v2.Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = v1.PureComponent:extend("EmptyPage");
local v10 = l_RoactFitComponents_0.Rect.quad(9, 0, 24, 0);
v9.validateProps = v6.strictInterface({
    page = v6.table, 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table)
});
v9.render = function(v11)
    local l_page_0 = v11.props.page;
    local v13 = l_page_0.EmptyString or l_page_0.Title;
    return l_withStyle_0(function(v14)
        return l_withLocalization_0({
            itemType = v13, 
            noItemsLabel = "Feature.Avatar.Label.NoItems"
        })(function(v15)
            local v16 = v15.noItemsLabel:gsub("({itemType})", v15.itemType);
            local l_Theme_0 = v14.Theme;
            local l_Font_0 = v14.Font;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v20 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            return v1.createElement(v5.Focusable[l_FitFrameVertical_0], {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 22), 
                margin = v10, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                NextSelectionUp = v11.props.NextSelectionUp, 
                NextSelectionDown = v11.props.NextSelectionDown
            }, {
                NoItemsText = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v20), 
                    BackgroundTransparency = 1, 
                    Text = v16, 
                    TextSize = v20, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    LayoutOrder = 1, 
                    Font = l_Font_1
                })
            });
        end);
    end);
end;
return v9;
