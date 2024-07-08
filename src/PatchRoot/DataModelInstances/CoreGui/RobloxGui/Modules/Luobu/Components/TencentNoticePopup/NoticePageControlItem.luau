local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local v8 = require(l_Modules_0.Common.Text);
local v9 = require(l_Modules_0.Luobu.Enum.TencentNoticeType);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = v2.PureComponent:extend("NoticePageControlItem");
v11.validateProps = v4.strictInterface({
    headerHeight = v4.number, 
    contentHeight = v4.number, 
    width = v4.number, 
    notice = v4.table, 
    layoutOrder = v4.number, 
    formFactor = v4.string, 
    hasOneNotice = v4.boolean
});
v11.render = function(v12)
    local l_headerHeight_0 = v12.props.headerHeight;
    local l_contentHeight_0 = v12.props.contentHeight;
    local l_width_0 = v12.props.width;
    local l_title_0 = v12.props.notice.title;
    local l_layoutOrder_0 = v12.props.layoutOrder;
    return l_withStyle_0(function(v18)
        local l_Font_0 = v18.Font;
        local l_Theme_0 = v18.Theme;
        return v2.createElement("Frame", {
            BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.fromOffset(l_width_0, l_headerHeight_0 + l_contentHeight_0), 
            AnchorPoint = Vector2.new(0, 0), 
            LayoutOrder = l_layoutOrder_0
        }, {
            TopFrame = v2.createElement("Frame", {
                Size = UDim2.fromOffset(l_width_0, l_headerHeight_0 + 10), 
                BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                BorderSizePixel = 0, 
                ZIndex = 3
            }, {
                TitleLabel = v2.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0.7, 0, 1, 0), 
                    Text = l_title_0, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    BackgroundTransparency = 1, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Font = l_Font_0.Header1.Font, 
                    TextSize = v18.Font.BaseSize * v18.Font.Header2.RelativeSize, 
                    BorderSizePixel = 0
                }), 
                DividerLine = v12.props.notice.type == v9.Text and v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    Size = UDim2.fromOffset(l_width_0 - 48, 1), 
                    Position = UDim2.fromOffset(24, l_headerHeight_0 + 10)
                })
            }), 
            ContentFrame = v12:renderContent(v18, l_headerHeight_0, l_width_0, l_contentHeight_0)
        });
    end);
end;
v11.renderContent = function(v21, v22, v23, v24, v25)
    local l_type_0 = v21.props.notice.type;
    if l_type_0 == v9.Text then
        return v21:renderTextContent(v22, v23, v24, v25);
    elseif l_type_0 == v9.Image then
        return v21:renderImageContent(v22, v23, v24, v25);
    else
        warn("Error: TencentNoticeType is incorrect" .. l_type_0);
        return nil;
    end;
end;
v11.renderTextContent = function(v27, v28, v29, v30, v31)
    local l_content_0 = v27.props.notice.content;
    if l_content_0 == nil then
        return nil;
    else
        local v33 = v30 - 48;
        local l_Theme_1 = v28.Theme;
        local l_Font_1 = v28.Font.Body.Font;
        local v36 = v28.Font.BaseSize * v28.Font.Body.RelativeSize;
        local l_TextDefault_0 = l_Theme_1.TextDefault;
        local v38 = v8.GetTextHeight(l_content_0, l_Font_1, v36, 10000);
        local v39 = v38 < v31 and v31 or v38;
        local v40 = v31 + 10;
        if v27.props.hasOneNotice then
            v40 = v40 - 48;
        end;
        return v2.createElement("ScrollingFrame", {
            Size = UDim2.fromOffset(v30, v40), 
            Position = UDim2.new(0, 0, 0, v29 - 10), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundUIDefault.Transparency, 
            CanvasSize = UDim2.new(0, v30, 0, v39), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarThickness = 0
        }, {
            Content = v2.createElement("TextLabel", {
                Size = UDim2.fromOffset(v33, v39), 
                Position = UDim2.fromOffset(24, 34), 
                Text = l_content_0, 
                Font = l_Font_1, 
                TextSize = v36, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_TextDefault_0.Color, 
                TextTransparency = l_TextDefault_0.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end;
end;
v11.renderImageContent = function(v41, v42, v43, v44, v45)
    local l_Theme_2 = v42.Theme;
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(v44, v45), 
        Position = UDim2.fromOffset(0, v43), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TopCoverLayer = v2.createElement("Frame", {
            BackgroundTransparency = l_Theme_2.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = l_Theme_2.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.fromOffset(v44, 10), 
            Position = UDim2.fromOffset(0, 0), 
            ZIndex = 2
        }), 
        ImageView = v2.createElement(l_LoadableImage_0, {
            Size = UDim2.fromOffset(v44, v45), 
            Position = UDim2.fromOffset(0, 0), 
            Image = not not (v41.props.formFactor == l_FormFactor_0.WIDE) and v41.props.notice.landscapePicUrl or v41.props.notice.portraitPicUrl, 
            useShimmerAnimationWhileLoading = true, 
            showFailedStateWhenLoadingFailed = true, 
            BackgroundTransparency = 1
        }, {
            gradientLayer = not v41.props.hasOneNotice and v2.createElement("Frame", {
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_2.Overlay.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.fromOffset(v44, 48), 
                Position = UDim2.fromOffset(0, v45 - 48), 
                ZIndex = 3
            }, {
                UIGradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.1, 1), 
                        NumberSequenceKeypoint.new(1, 0)
                    })
                })
            })
        })
    });
end;
return (v3.connect(function(v47)
    return {
        formFactor = v47.FormFactor
    };
end, nil)(v11));
