local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v4.Style.withStyle;
local l_SpringAnimatedItem_0 = v4.Utility.SpringAnimatedItem;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v11 = v3.PureComponent:extend("NavHighlight");
local v12 = l_Images_0["component_assets/triangleUp_16"];
local v13 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v14 = Vector2.new(20, 8);
local function v16(v15)
    return {
        Size = UDim2.new(0, v15.width, 1, 0), 
        Position = UDim2.fromOffset(v15.position, 0)
    };
end;
if v10() then
    v11.validateProps = v5.strictInterface({
        useArrowHighlight = v5.optional(v5.boolean), 
        selectedCategoryButtonRef = v5.optional(v5.table), 
        scrollingFrameRef = v5.table
    });
end;
v11.render = function(v17)
    local l_useArrowHighlight_0 = v17.props.useArrowHighlight;
    local v19 = 0;
    local v20 = 0;
    v19 = v10() and 0 or v17.props.selectedCategoryButtonWidth;
    v20 = v10() and 0 or v17.props.selectedCategoryButtonPositionX;
    if not (not v10() or not v17.props.selectedCategoryButtonRef) then
        local v21 = v17.props.selectedCategoryButtonRef:getValue();
        if v21 then
            v19 = v21.AbsoluteSize.X;
            v20 = v21.AbsolutePosition.X;
        end;
    end;
    local v22 = v17.props.scrollingFrameRef:getValue();
    if v22 then
        v20 = (v20 + v22.CanvasPosition.X) - v22.AbsolutePosition.X;
    end;
    return l_withStyle_0(function(v23)
        local l_Theme_0 = v23.Theme;
        return v3.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                BackgroundTransparency = 1
            }, 
            animatedValues = {
                width = v19, 
                position = v20
            }, 
            mapValuesToProps = v16, 
            springOptions = v13
        }, {
            Highlight = not l_useArrowHighlight_0 and v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, 3), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.IconEmphasis.Color, 
                BackgroundTransparency = l_Theme_0.IconEmphasis.Transparency
            }), 
            ArrowHighlight = l_useArrowHighlight_0 and v3.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, 0), 
                Size = UDim2.new(0, v14.X, 0, v14.Y), 
                Image = v12, 
                ImageColor3 = l_Theme_0.BackgroundContrast.Color, 
                ImageTransparency = l_Theme_0.BackgroundContrast.Transparency
            })
        });
    end);
end;
return v11;
