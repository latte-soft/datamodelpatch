local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v4 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v5 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v6 = v1.PureComponent:extend("ModalBottomSheetButton");
local l_ImageRectSize_0 = v5["component_assets/circle_17"].ImageRectSize;
local l_ImageRectOffset_0 = v5["component_assets/circle_17"].ImageRectOffset;
local v9 = 8 * v5.ImagesResolutionScale;
local v10 = 8 * v5.ImagesResolutionScale;
local v11 = Rect.new(v9, v10, l_ImageRectSize_0.x - v9, l_ImageRectSize_0.y - v10);
v6.validateProps = v2.strictInterface({
    icon = v2.optional(v2.union(v2.table, v2.string)), 
    text = v2.optional(v2.string), 
    onActivated = v2.optional(v2.callback), 
    renderRightElement = v2.optional(v2.callback), 
    showImage = v2.boolean, 
    isFixed = v2.boolean, 
    onActivatedAndDismissed = v2.callback, 
    elementHeight = v2.integer, 
    hasRoundBottom = v2.boolean, 
    hasRoundTop = v2.boolean, 
    LayoutOrder = v2.integer, 
    stayOnActivated = v2.optional(v2.boolean)
});
v6.defaultProps = {
    icon = {}, 
    text = "", 
    onActivated = function()
    end
};
v6.init = function(v12)
    v12.ref = v1.createRef();
    v12.onColorChange = function(v13)
        if v12.ref.current then
            v12.ref.current.ImageColor3 = v13;
            return ;
        else
            return ;
        end;
    end;
    v12.onInputBegan = function(v14)
        local v15 = true;
        if v14.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v15 = v14.UserInputType == Enum.UserInputType.Touch;
        end;
        return v15;
    end;
    v12.onInputEnd = function(v16)
        local v17 = true;
        if v16.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v17 = v16.UserInputType == Enum.UserInputType.Touch;
        end;
        return v17;
    end;
end;
v6.render = function(v18)
    local l_hasRoundTop_0 = v18.props.hasRoundTop;
    local l_hasRoundBottom_0 = v18.props.hasRoundBottom;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local l_X_0 = l_ImageRectSize_0.X;
    local v25 = l_X_0 / 2;
    if not l_hasRoundTop_0 or not l_hasRoundBottom_0 then
        if not l_hasRoundTop_0 then
            if not l_hasRoundBottom_0 then
                v21 = Vector2.new(1, 1);
                v22 = l_ImageRectOffset_0 + Vector2.new(v25, v25);
            else
                v21 = Vector2.new(l_X_0, v25);
                v22 = l_ImageRectOffset_0 + Vector2.new(0, v25);
                v23 = Rect.new(v25 - 1, 0, v25 + 1, 1);
            end;
        else
            v21 = Vector2.new(l_X_0, v25);
            v22 = l_ImageRectOffset_0;
            v23 = Rect.new(v25 - 1, v25 - 1, v25 + 1, v25);
        end;
    else
        v21 = l_ImageRectSize_0;
        v22 = l_ImageRectOffset_0;
        v23 = v11;
    end;
    local l_elementHeight_0 = v18.props.elementHeight;
    local v27 = nil;
    v27 = if not v18.props.isFixed then UDim2.new(1, -32, 0, l_elementHeight_0) else UDim2.new(0, 300, 0, l_elementHeight_0);
    local v28 = 24;
    if not (not v18.props.showImage and not v18.props.renderRightElement) then
        v28 = 12;
    end;
    local l_v28_0 = v28;
    local v30 = l_elementHeight_0 * 0.8;
    if v18.props.showImage then
        l_v28_0 = (l_v28_0 + v30) + v28;
    end;
    if v18.props.renderRightElement then
        l_v28_0 = (l_v28_0 + v30) + v28;
    end;
    return v3(function(v31)
        local l_Theme_0 = v31.Theme;
        local l_Font_0 = v31.Font;
        local l_Transparency_0 = l_Theme_0.BackgroundUIDefault.Transparency;
        local l_Color_0 = l_Theme_0.TextEmphasis.Color;
        return v1.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v23, 
            Image = v5["component_assets/circle_17"].Image, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageRectSize = v21, 
            ImageRectOffset = v22, 
            ImageTransparency = l_Transparency_0, 
            Size = v27, 
            LayoutOrder = v18.props.LayoutOrder, 
            [v1.Ref] = v18.ref, 
            [v1.Event.Activated] = v18.props.onActivatedAndDismissed, 
            [v1.Event.InputBegan] = function(_, v37)
                if v18.onInputBegan(v37) then
                    v18.onColorChange(l_Theme_0.BackgroundOnPress.Color);
                end;
            end, 
            [v1.Event.InputEnded] = function(_, v39)
                if v18.onInputEnd(v39) then
                    v18.onColorChange(l_Theme_0.BackgroundUIDefault.Color);
                end;
            end
        }, {
            buttonContents = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                horizontalLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v28)
                }), 
                padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v28), 
                    PaddingTop = UDim.new(0.1, 0), 
                    PaddingBottom = UDim.new(0.1, 0)
                }), 
                icon = not not v18.props.showImage and v1.createElement(v4.Label, {
                    Image = v18.props.icon, 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = l_Transparency_0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v30, 0, v30), 
                    LayoutOrder = 1
                }) or nil, 
                textLabel = v1.createElement("TextLabel", {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -l_v28_0, 1, 0), 
                    Text = v18.props.text, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_0.Header2.Font, 
                    TextColor3 = l_Color_0, 
                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = 2
                }), 
                rightContainer = v18.props.renderRightElement and v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v30, 0, v30), 
                    LayoutOrder = 3
                }, {
                    hint = v18.props.renderRightElement()
                })
            }), 
            bottomBorder = not l_hasRoundBottom_0 and v1.createElement("Frame", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0)
            })
        });
    end);
end;
return v6;
