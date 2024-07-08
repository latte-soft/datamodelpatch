local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Parent_0.ImageSet.Images);
local v8 = require(l_Core_0.ImageSet.ImageSetComponent);
local v9 = require(l_Core_0.Control.Controllable);
local v10 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(l_Parent_1.Core.Style.withStyle);
local v12 = v4.PureComponent:extend("ModalTitle");
v12.validateProps = v5.strictInterface({
    title = v5.string, 
    position = v5.optional(v5.UDim2), 
    anchor = v5.optional(v5.Vector2), 
    onCloseClicked = v5.optional(v5.callback), 
    titleBackgroundImageProps = v5.optional(v5.strictInterface({
        image = v5.string, 
        imageHeight = v5.number, 
        text = v5.optional(v5.string)
    })), 
    onTitleSizeChanged = v5.optional(v5.callback)
});
v12.defaultProps = {
    title = "", 
    position = UDim2.new(0.5, 0, 0, 0), 
    anchor = Vector2.new(0.5, 0)
};
v12.GetHeight = function(_)
    return 48;
end;
local function v22(v14, v15, v16)
    local l_text_0 = v14.text;
    local v18 = l_text_0 and #l_text_0 > 0;
    local v19 = l_text_0 and #l_text_0 > 0;
    local v20 = math.clamp(v14.imageHeight, 48, 261);
    if v18 then
        v20 = v20 + 8;
        v16 = v6.Dictionary.join(v16, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        });
    end;
    if l_text_0 and #l_text_0 > 0 then
        v16 = v6.Dictionary.join(v16, {
            BackgroundText = v4.createElement(v10, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                fontStyle = v15.Font.Body, 
                colorStyle = v15.Theme.TextEmphasis, 
                RichText = true, 
                Text = l_text_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                ZIndex = 2
            })
        });
    end;
    if v19 then
        v16 = v6.Dictionary.join(v16, {
            BackgroundTextShadow = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, not v18 and 0 or -8), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 0, 
                ZIndex = 1
            }, {
                UIGradient = v4.createElement("UIGradient", {
                    Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.6, 0.25), 
                        NumberSequenceKeypoint.new(1, 1)
                    }), 
                    Rotation = 90
                })
            })
        });
    end;
    local v21 = v4.createElement(v8.Label, {
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.new(1, 0, 0, v20), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Crop, 
        BorderSizePixel = 0, 
        Image = v14.image, 
        ImageColor3 = Color3.fromRGB(255, 255, 255)
    }, v16);
    if v18 then
        v21 = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 0, v20 - 8), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            TitleBackground = v21
        });
    end;
    return v21;
end;
v12.render = function(v23)
    local l_titleBackgroundImageProps_0 = v23.props.titleBackgroundImageProps;
    return v11(function(v25)
        local l_Font_0 = v25.Font;
        local l_Theme_0 = v25.Theme;
        local v28 = v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1, 
            [v4.Change.AbsoluteSize] = v23.props.onTitleSizeChanged
        }, {
            CloseButton = not not v23.props.onCloseClicked and v4.createElement(v9, {
                controlComponent = {
                    component = v8.Button, 
                    props = {
                        BackgroundTransparency = 1, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0, 32, 0.5, 0), 
                        Size = UDim2.new(0, 48, 0, 48), 
                        [v4.Event.Activated] = v23.props.onCloseClicked
                    }, 
                    children = {
                        InputFillImage = v4.createElement(v8.Label, {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 36, 0, 36), 
                            Image = v7["icons/navigation/close"], 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0)
                        })
                    }
                }, 
                onStateChanged = function(...)
                end
            }) or nil, 
            Title = v4.createElement(v10, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -104, 1, 0), 
                colorStyle = l_Theme_0.TextEmphasis, 
                fontStyle = l_Font_0.Header1, 
                LayoutOrder = 1, 
                Text = v23.props.title, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8), 
                    PaddingBottom = UDim.new(0, 8)
                })
            }), 
            Underline = not l_titleBackgroundImageProps_0 and v4.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 1)
            })
        });
        if not l_titleBackgroundImageProps_0 then
            return v28;
        else
            return (v22(l_titleBackgroundImageProps_0, v25, {
                TitleText = v28
            }));
        end;
    end);
end;
return v12;
