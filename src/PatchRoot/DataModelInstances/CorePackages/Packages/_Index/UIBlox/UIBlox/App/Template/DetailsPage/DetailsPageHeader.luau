local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_2.Core.Style.withStyle);
local l_Label_0 = require(l_Parent_2.Core.ImageSet.ImageSetComponent).Label;
local v6 = require(l_Parent_2.App.ImageSet.Images);
local v7 = require(l_Parent_1.Loading.LoadableImage);
local v8 = require(l_Parent_1.Button.ActionBar);
local l_DeviceType_0 = require(l_Parent_1.Style.Constants).DeviceType;
local v10 = require(l_Parent_3.Roact);
local v11 = require(l_Parent_3.t);
local v12 = require(l_Parent_0.DetailsPageTitleContent);
local v13 = v10.PureComponent:extend("DetailsPageHeader");
v13.defaultProps = {
    thumbnailHeight = 200, 
    thumbnailAspectRatio = Vector2.new(1, 1), 
    actionBarHeight = 48, 
    actionBarWidth = 380
};
v13.validateProps = v11.strictInterface({
    thumbnailImageUrl = v11.optional(v11.string), 
    thumbnailAspectRatio = v11.optional(v11.Vector2), 
    thumbnailHeight = v11.optional(v11.number), 
    titleText = v11.optional(v11.string), 
    subTitleText = v11.optional(v11.string), 
    renderInfoContent = v11.optional(v11.callback), 
    headerBarBackgroundHeight = v11.optional(v11.number), 
    sideMargin = v11.optional(v11.number), 
    itemPadding = v11.optional(v11.number), 
    bottomMargin = v11.optional(v11.number), 
    gradientHeight = v11.optional(v11.number), 
    thumbnailShadowHeight = v11.optional(v11.number), 
    actionBarHeight = v11.optional(v11.number), 
    actionBarWidth = v11.optional(v11.number), 
    actionBarProps = v11.optional(v8.validateProps), 
    deviceType = v11.optional(v11.string)
});
v13.renderThumbnail = function(v14, v15, v16, v17, v18)
    return v10.createElement("Frame", {
        Size = UDim2.fromOffset(v17, v18), 
        LayoutOrder = 1, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        ThumbnailTile = v10.createElement(v7, {
            cornerRadius = UDim.new(0, 8), 
            Size = UDim2.fromScale(1, 1), 
            Image = v14.props.thumbnailImageUrl
        }), 
        DropShadow = if v16 > 0 then v10.createElement(l_Label_0, {
            Size = UDim2.new(1, 0, 0, 28), 
            Position = UDim2.fromScale(0, 1), 
            BackgroundTransparency = 1, 
            Image = v6["component_assets/dropshadow_thumbnail_28"], 
            ImageColor3 = v15.Theme.DropShadow.Color, 
            ImageTransparency = v15.Theme.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(32, 0, 33, 28)
        }) else nil
    });
end;
v13.renderDesktopMode = function(v19, v20)
    local l_thumbnailHeight_0 = v19.props.thumbnailHeight;
    local v22 = l_thumbnailHeight_0 * (v19.props.thumbnailAspectRatio.X / v19.props.thumbnailAspectRatio.Y);
    local v23 = v19.props.sideMargin or 48;
    local v24 = v19.props.itemPadding or 24;
    local v25 = 28;
    if v19.props.thumbnailShadowHeight ~= nil then
        v25 = v19.props.thumbnailShadowHeight;
    end;
    return {
        Padding = v10.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v23), 
            PaddingRight = UDim.new(0, v23), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        Layout = v10.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v24)
        }), 
        ThumbnailTileFrame = v19:renderThumbnail(v20, v25, v22, l_thumbnailHeight_0), 
        InfoFrame = v10.createElement("Frame", {
            Size = UDim2.new(1, -(v22 + v23 * 2), 1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            Layout = v10.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            TitleInfo = v10.createElement(v12, {
                titleText = v19.props.titleText, 
                subTitleText = v19.props.subTitleText, 
                renderInfoContent = v19.props.renderInfoContent, 
                verticalAlignment = Enum.VerticalAlignment.Top, 
                layoutOrder = 1
            }), 
            Padding = v10.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 16), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            ActonBarFrame = v10.createElement("Frame", {
                Size = UDim2.fromOffset(v19.props.actionBarWidth, v19.props.actionBarHeight), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                ActionBar = not not v19.props.actionBarProps and v10.createElement(v8, {
                    button = v19.props.actionBarProps.button, 
                    icons = v19.props.actionBarProps.icons, 
                    iconSize = v19.props.actionBarProps.iconSize, 
                    buttonHeight = v19.props.actionBarProps.buttonHeight, 
                    buttonPadding = v19.props.actionBarProps.buttonPadding, 
                    textButtons = v19.props.actionBarProps.textButtons, 
                    enableButtonAtStart = true, 
                    marginOverride = {
                        left = 0, 
                        right = 0, 
                        top = 0, 
                        bottom = 0
                    }, 
                    horizontalAlignment = Enum.HorizontalAlignment.Left
                }) or nil
            })
        })
    };
end;
v13.renderisPhone = function(v26, v27)
    local l_thumbnailHeight_1 = v26.props.thumbnailHeight;
    local v29 = l_thumbnailHeight_1 * (v26.props.thumbnailAspectRatio.X / v26.props.thumbnailAspectRatio.Y);
    local v30 = v26.props.sideMargin or 24;
    return {
        Padding = v10.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v30), 
            PaddingRight = UDim.new(0, v30), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        ThumbnailTileFrame = v26:renderThumbnail(v27, v29, l_thumbnailHeight_1)
    };
end;
v13.render = function(v31)
    local v32 = v31.props.deviceType == l_DeviceType_0.Phone;
    local l_thumbnailHeight_2 = v31.props.thumbnailHeight;
    local v34 = v31.props.headerBarBackgroundHeight or 80;
    local v35 = v31.props.gradientHeight or ((l_thumbnailHeight_2 + 16) - v34) + 44;
    local l_bottomMargin_0 = v31.props.bottomMargin;
    return v4(function(v37)
        local l_Theme_0 = v37.Theme;
        return v10.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Layout = v10.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            GradientBar = v10.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v35), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                Gradient = v10.createElement("UIGradient", {
                    Rotation = 270, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(0.5, 0.25), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            BackgroundBar = v10.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v34), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, not not v32 and v31:renderisPhone(v37, l_thumbnailHeight_2) or v31:renderDesktopMode(v37, l_thumbnailHeight_2)), 
            Padding = if not l_bottomMargin_0 then nil else v10.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_bottomMargin_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            })
        });
    end);
end;
return v13;
