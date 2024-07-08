local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_3.Otter);
local v7 = require(l_Parent_2.Core.Style.withStyle);
local v8 = require(l_Parent_1.ImageSet.Images);
local l_Label_0 = require(l_Parent_2.Core.ImageSet.ImageSetComponent).Label;
local v10 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(l_Parent_2.Core.Text.GetTextSize);
local v12 = require(l_Parent_2.Core.Text.GetTextHeight);
local v13 = require(l_Parent_2.Utility.divideTransparency);
local v14 = require(l_Parent_2.Utility.lerp);
local v15 = require(l_Parent_0.Enum.TooltipOrientation);
local v16 = require(l_Parent_0.getPositionInfo);
local v17 = {
    [v15.Bottom] = v8["component_assets/triangleUp_16"], 
    [v15.Top] = v8["component_assets/triangleDown_16"], 
    [v15.Right] = v8["component_assets/triangleLeft_16"], 
    [v15.Left] = v8["component_assets/triangleRight_16"]
};
local v18 = {
    frequency = 50, 
    dampingRatio = 1
};
local v19 = v4.PureComponent:extend("TooltipContainer");
v19.validateProps = v5.strictInterface({
    triggerPosition = v5.Vector2, 
    triggerSize = v5.Vector2, 
    bodyText = v5.string, 
    headerText = v5.optional(v5.string), 
    screenSize = v5.optional(v5.Vector2), 
    position = v5.optional(v5.UDim2), 
    orientation = v5.optional(v15.isEnumValue), 
    isDirectChild = v5.optional(v5.boolean)
});
v19.defaultProps = {
    screenSize = Vector2.new(10000, 10000), 
    orientation = v15.Bottom, 
    isDirectChild = false
};
v19.init = function(v20)
    v20.visible = true;
    local v21 = nil;
    local v22, v23 = v4.createBinding(0);
    v20.progress = v22;
    v21 = v23;
    v20.progressMotor = v6.createSingleMotor(0);
    v20.progressMotor:onStep(v21);
    v20.progressMotor:setGoal(v6.spring(1, v18));
end;
v19.render = function(v24)
    return v7(function(v25)
        local l_Font_0 = v25.Font;
        local l_Theme_0 = v25.Theme;
        local l_CaptionHeader_0 = l_Font_0.CaptionHeader;
        local l_CaptionBody_0 = l_Font_0.CaptionBody;
        local v30 = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize;
        local l_X_0 = v11(v24.props.bodyText, v30, l_CaptionBody_0.Font, Vector2.new()).X;
        if v24.props.headerText then
            l_X_0 = math.max(l_X_0, v11(v24.props.headerText, l_Font_0.BaseSize * l_CaptionHeader_0.RelativeSize, l_CaptionHeader_0.Font, Vector2.new()).X);
        end;
        local v32 = math.min(l_X_0, 216);
        local v33 = v32 + 24;
        local v34 = v12(v24.props.bodyText, l_CaptionBody_0.Font, v30, v32);
        local v35 = not not v24.props.headerText and v12(v24.props.headerText, l_CaptionHeader_0.Font, v30, v32) or 0;
        local v36 = not not v24.props.headerText and ((v35 + v34) + 24) + 4 or v34 + 24;
        local v37 = v16(v33, v36, v24.props.orientation, v24.props.triggerPosition, v24.props.triggerSize, v24.props.screenSize, v24.props.position);
        local v40 = v24.progress:map(function(v38)
            local v39 = nil;
            v39 = if not v24.props.position then not not v24.props.isDirectChild and v37.position or v37.absolutePosition else v24.props.position;
            return v39:lerp(v39 + v37.animatedDistance, v38);
        end);
        local v42 = v24.progress:map(function(v41)
            return v14(1, v13(l_Theme_0.BackgroundMuted.Transparency, 1), v41);
        end);
        local v44 = v24.progress:map(function(v43)
            return v14(1, v13(l_Theme_0.TextEmphasis.Transparency, 2), v43);
        end);
        return v4.createElement("Frame", {
            Visible = v24.visible, 
            Position = v40, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v37.fillDirection == Enum.FillDirection.Vertical and UDim2.fromOffset(v33, v36 + 8) or UDim2.fromOffset(v33 + 8, v36)
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = v37.fillDirection
            }), 
            CaretFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v37.caretFrameSize, 
                LayoutOrder = v37.caretLayoutOrder
            }, {
                Caret = v4.createElement(l_Label_0, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Position = v37.caretPosition, 
                    AnchorPoint = v37.caretAnchorPoint, 
                    Size = v37.caretImageSize, 
                    Image = v17[v37.updatedOrientation], 
                    ImageColor3 = l_Theme_0.BackgroundMuted.Color, 
                    ImageTransparency = v42, 
                    [v4.Ref] = v24.caretRef
                })
            }), 
            Content = v4.createElement("TextButton", {
                AutoButtonColor = false, 
                Text = "", 
                Selectable = false, 
                Size = UDim2.fromOffset(v33, v36), 
                BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                BackgroundTransparency = v42, 
                BorderSizePixel = 0, 
                LayoutOrder = v37.contentLayoutOrder
            }, {
                VerticalLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 4), 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                Header = v24.props.headerText and v4.createElement(v10, {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_CaptionHeader_0, 
                    LayoutOrder = 1, 
                    Text = v24.props.headerText, 
                    TextTransparency = v44, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(1, 0, 0, v35)
                }), 
                Body = v4.createElement(v10, {
                    colorStyle = l_Theme_0.TextDefault, 
                    fontStyle = l_CaptionBody_0, 
                    LayoutOrder = 2, 
                    Text = v24.props.bodyText, 
                    TextTransparency = v44, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(1, 0, 0, v34)
                })
            })
        });
    end);
end;
v19.didMount = function(v45)
    v45.progressMotor:start();
end;
v19.didUpdate = function(v46, v47, _)
    if v47.triggerPosition ~= v46.props.triggerPosition then
        if not (v46.props.triggerPosition.Y >= 0) or v46.props.screenSize.Y < v46.props.triggerPosition.Y + v46.props.triggerSize.Y then
            v46.visible = false;
            return ;
        else
            v46.visible = true;
        end;
    end;
end;
v19.willUnmount = function(v49)
    v49.progressMotor:destroy();
    v49.progressMotor = nil;
end;
return v19;
