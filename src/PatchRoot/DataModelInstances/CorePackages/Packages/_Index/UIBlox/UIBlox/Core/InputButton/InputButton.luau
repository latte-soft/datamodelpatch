local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.RoactGamepad);
local v5 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v6 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v7 = require(l_Parent_0.UIBlox.Core.Control.Controllable);
local v8 = require(l_Parent_0.UIBlox.Core.Control.Enum.ControlState);
local v9 = require(l_Parent_0.UIBlox.Core.Utility.GetEngineFeatureSafe);
local v10 = require(l_Parent_0.UIBlox.Core.Text.GetTextSize);
local l_FitTextLabel_0 = require(l_Parent_0.FitFrame).FitTextLabel;
local l_FitFrameHorizontal_0 = require(l_Parent_0.FitFrame).FitFrameHorizontal;
local v13 = v9("TextBoundsRoundUp");
local v14 = v1.PureComponent:extend("InputButton");
v14.validateProps = v2.strictInterface({
    text = v2.string, 
    size = v2.optional(v2.UDim2), 
    image = v2.table, 
    imageColor = v2.Color3, 
    fillImage = v2.optional(v2.table), 
    fillImageSize = v2.optional(v2.UDim2), 
    fillImageColor = v2.optional(v2.Color3), 
    selectedColor = v2.Color3, 
    textColor = v2.Color3, 
    transparency = v2.number, 
    onActivated = v2.callback, 
    isDisabled = v2.optional(v2.boolean), 
    layoutOrder = v2.optional(v2.number), 
    frameRef = v2.optional(v2.table), 
    NextSelectionLeft = v2.optional(v2.table), 
    NextSelectionRight = v2.optional(v2.table), 
    NextSelectionUp = v2.optional(v2.table), 
    NextSelectionDown = v2.optional(v2.table), 
    SelectionImageObject = v2.optional(v2.table)
});
v14.defaultProps = {
    layoutOrder = 0, 
    isDisabled = false
};
v14.init = function(v15)
    v15.state = {
        outerImage = v15.props.image, 
        outerTransparency = 1, 
        outerImageColor = v15.props.imageColor, 
        innerImage = v15.props.image, 
        innerImageColor = v15.props.fillImageColor, 
        innerTransparency = 1
    };
    v15.changeSprite = function(v16)
        if v16 == v8.Hover then
            if not v15.props.isDisabled then
                v15:setState({
                    outerImageColor = v15.props.selectedColor
                });
                return ;
            end;
        elseif v16 == v8.Default then
            v15:setState({
                outerImageColor = v15.props.imageColor
            });
        end;
    end;
    if not v15.props.size then
        local v17, v18 = v1.createBinding(UDim2.new(1, 0, 0, 26));
        v15.sizeBinding = v17;
        v15.updateSizeBinding = v18;
        v15.textAbsoluteSizeChanged = function(v19)
            local v20 = 26;
            if v20 < v19.AbsoluteSize.Y then
                v20 = v19.AbsoluteSize.Y;
            end;
            v15.updateSizeBinding(UDim2.new(1, 0, 0, v20));
        end;
    end;
end;
v14.render = function(v21)
    return v5(function(v22)
        local l_Font_0 = v22.Font;
        local v24 = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize;
        local v25 = nil;
        local v26 = {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Text = v21.props.text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v24, 
            Font = l_Font_0.Body.Font, 
            TextWrapped = true, 
            TextColor3 = v21.props.textColor, 
            TextTransparency = v21.props.transparency
        };
        local v27 = "Frame";
        local v28 = false;
        if not v21.props.size then
            v28 = true;
            v27 = l_FitFrameHorizontal_0;
            v25 = l_FitTextLabel_0;
            v26 = v3.Dictionary.join(v26, {
                width = l_FitTextLabel_0.Width.FitToText, 
                onActivated = v21.props.onActivated, 
                [v1.Change.AbsoluteSize] = v21.textAbsoluteSizeChanged
            });
        else
            local l_size_0 = v21.props.size;
            local l_X_0 = v10(v21.props.text, v24, l_Font_0.Body.Font, (Vector2.new((l_size_0.X.Offset - 26) - 8, l_size_0.Y.Offset))).X;
            if not v13 and l_X_0 > 0 then
                l_X_0 = l_X_0 + 1;
            end;
            v25 = "TextButton";
            v26 = v3.Dictionary.join(v26, {
                Size = UDim2.new(0, l_X_0, 1, 0), 
                [v1.Event.Activated] = not v21.props.isDisabled and v21.props.onActivated or nil
            });
        end;
        v27 = v4.Focusable[v27];
        local l_fillImage_0 = v21.props.fillImage;
        local l_createElement_0 = v1.createElement;
        local l_v27_0 = v27;
        local v34 = {
            Size = not v28 and (v21.props.size or v21.sizeBinding) or nil, 
            height = not not v28 and UDim.new(0, 26) or nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = v21.props.layoutOrder, 
            [v1.Ref] = v21.props.frameRef, 
            SelectionImageObject = v21.props.SelectionImageObject, 
            inputBindings = {
                Activated = v4.Input.onBegin(Enum.KeyCode.ButtonA, v21.props.onActivated)
            }, 
            FillDirection = not not v28 and Enum.FillDirection.Horizontal or nil, 
            VerticalAlignment = not not v28 and Enum.VerticalAlignment.Center or nil, 
            contentPadding = not not v28 and UDim.new(0, 8) or nil
        };
        local v37 = {
            HorizontalLayout = not v28 and v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }) or nil, 
            Padding = not v28 and v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8)
            }) or nil, 
            InputButtonImage = v1.createElement(v7, {
                controlComponent = {
                    component = v6.Button, 
                    props = {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 26, 0, 26), 
                        Image = v21.props.image, 
                        ImageTransparency = v21.props.transparency, 
                        ScaleType = v21.props.buttonSliceType, 
                        SliceCenter = v21.props.buttonSliceCenter, 
                        ImageColor3 = v21.state.outerImageColor, 
                        [v1.Event.Activated] = v21.props.onActivated, 
                        LayoutOrder = 1
                    }, 
                    children = {
                        InputFillImage = l_fillImage_0 and v1.createElement(v6.Label, {
                            BackgroundTransparency = 1, 
                            Size = v21.props.fillImageSize, 
                            Image = l_fillImage_0, 
                            ImageTransparency = v21.props.transparency, 
                            ImageColor3 = v21.props.fillImageColor, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0)
                        })
                    }
                }, 
                isDisabled = v21.props.isDisabled, 
                onStateChanged = function(_, v36)
                    v21.changeSprite(v36);
                end
            })
        };
        local v38 = false;
        if v21.props.text ~= "" then
            v38 = v1.createElement(v7, {
                controlComponent = {
                    component = v25, 
                    props = v26
                }, 
                isDisabled = v21.props.isDisabled, 
                onStateChanged = function(_, v40)
                    v21.changeSprite(v40);
                end
            });
        end;
        v37.InputButtonText = v38;
        return l_createElement_0(l_v27_0, v34, v37);
    end);
end;
return v1.forwardRef(function(v41, v42)
    return v1.createElement(v14, v3.Dictionary.join(v41, {
        frameRef = v42
    }));
end);
