local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_IconSize_0 = v3.App.Constant.IconSize;
local l_withStyle_0 = v3.Style.withStyle;
local v9 = l_Images_0["icons/actions/previewShrink"];
local v10 = l_Images_0["icons/actions/previewExpand"];
local v11 = Vector2.new(8, 8);
local v12 = l_Images_0["component_assets/circle_17"];
local v13 = l_Images_0["component_assets/dropshadow_24_6"];
local v14 = v1.PureComponent:extend("FullViewEntryButton");
v14.validateProps = v2.strictInterface({
    isUIFullView = v2.optional(v2.boolean), 
    isSceneFullView = v2.optional(v2.boolean), 
    changeViewFunction = v2.optional(v2.callback), 
    LayoutOrder = v2.number
});
v14.renderExpandButton = function(v15, v16)
    return v1.createElement(l_ImageSetButton_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
        Image = v9, 
        ImageColor3 = v16.IconEmphasis.Color, 
        ImageTransparency = v16.IconEmphasis.Transparency, 
        LayoutOrder = v15.props.LayoutOrder, 
        [v1.Event.Activated] = v15.props.changeViewFunction
    });
end;
v14.renderCollapseButton = function(v17, v18)
    return v1.createElement(l_ImageSetLabel_0, {
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.new(1, 0, 1, 0), 
        Size = UDim2.new(0, (l_IconSize_0.Regular + v11.X) + 14, 0, (l_IconSize_0.Regular + v11.Y) + 14), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(16, 16, 18, 18), 
        Image = v13, 
        ImageColor3 = v18.DropShadow.Color, 
        ImageTransparency = v18.DropShadow.Transparency, 
        LayoutOrder = v17.props.LayoutOrder, 
        ZIndex = 2
    }, {
        BackgroundImage = v1.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, l_IconSize_0.Regular + v11.X, 0, l_IconSize_0.Regular + v11.Y), 
            BackgroundTransparency = 1, 
            Image = v12, 
            ImageColor3 = v18.BackgroundContrast.Color, 
            ImageTransparency = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            [v1.Event.Activated] = v17.props.changeViewFunction
        }, {
            FullViewImageButton = v1.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Image = v10, 
                ImageColor3 = v18.IconEmphasis.Color, 
                ImageTransparency = v18.IconEmphasis.Transparency, 
                Size = UDim2.new(0, -l_IconSize_0.Regular, 0, -l_IconSize_0.Regular), 
                BackgroundTransparency = 1
            })
        })
    });
end;
v14.render = function(v19)
    return l_withStyle_0(function(v20)
        local l_Theme_0 = v20.Theme;
        if v19.props.isUIFullView then
            return v19:renderCollapseButton(l_Theme_0);
        else
            return v19:renderExpandButton(l_Theme_0);
        end;
    end);
end;
return v14;
