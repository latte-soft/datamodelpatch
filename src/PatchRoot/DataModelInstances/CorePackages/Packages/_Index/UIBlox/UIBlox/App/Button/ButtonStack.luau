local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_0.Button);
local v8 = require(l_Parent_0.Enum.ButtonType);
local v9 = require(l_Parent_1.Core.Text.GetTextSize);
local v10 = require(l_Parent_1.Core.Style.withStyle);
local v11 = require(l_Parent_1.UIBloxConfig);
local l_FitFrameOnAxis_0 = require(l_Parent_2.FitFrame).FitFrameOnAxis;
local v13 = v3.PureComponent:extend("ButtonStack");
v13.validateProps = v6.strictInterface({
    buttons = v6.array(v6.strictInterface({
        buttonType = v6.optional(v8.isEnumValue), 
        props = v7.validateProps, 
        isDefaultChild = v6.optional(v6.boolean)
    })), 
    buttonHeight = v6.optional(v6.numberMin(0)), 
    forcedFillDirection = v6.optional(v6.enum(Enum.FillDirection)), 
    marginBetween = v6.optional(v6.numberMin(0)), 
    minHorizontalButtonPadding = v6.optional(v6.numberMin(0)), 
    disableRoactGamepadButtonSelection = v6.optional(v6.boolean), 
    disableGamepadRefs = v6.optional(v6.boolean), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table)
});
v13.defaultProps = {
    buttonHeight = 36, 
    marginBetween = 12, 
    minHorizontalButtonPadding = 8
};
v13.init = function(v14)
    v14.buttonRefs = v5.createRefCache();
    v14.state = {
        frameWidth = 0
    };
    v14.updateFrameSize = function(v15)
        local l_X_0 = v15.AbsoluteSize.X;
        if l_X_0 ~= v14.state.frameWidth then
            v14:setState({
                frameWidth = l_X_0
            });
        end;
    end;
end;
v13.render = function(v17)
    return v10(function(v18)
        local l_Font_0 = v18.Font;
        local v20 = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize;
        local l_buttons_0 = v17.props.buttons;
        local v22 = #l_buttons_0 > 1 and v17.props.marginBetween or 0;
        local v23 = v17.state.frameWidth / #l_buttons_0 - (v22 * (#l_buttons_0 - 1)) / #l_buttons_0;
        local v24 = false;
        local v25 = nil;
        local v26 = nil;
        if not v17.props.forcedFillDirection then
            for _, v28 in ipairs(l_buttons_0) do
                if v23 - 2 * v17.props.minHorizontalButtonPadding < v9(v28.props.text or "", v20, l_Font_0.Body.Font, Vector2.new(v17.state.frameWidth, v17.props.buttonHeight), not not v11.ignoreRichTextTagsForTextSizeCalculation and if v28.props.buttonTextOverride then v28.props.buttonTextOverride.RichText else false).X then
                    v24 = true;
                    break;
                end;
            end;
            v25 = not not v24 and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal;
        else
            v24 = v17.props.forcedFillDirection == Enum.FillDirection.Vertical;
            v25 = v17.props.forcedFillDirection;
        end;
        local v29 = not not v24 and UDim2.new(1, 0, 0, v17.props.buttonHeight) or UDim2.new(0, v23, 0, v17.props.buttonHeight);
        local v30 = {};
        for v31, v32 in ipairs(l_buttons_0) do
            local v33 = v4.Dictionary.join({
                key = tostring(v31), 
                layoutOrder = not not v24 and #l_buttons_0 - v31 or v31, 
                size = v29, 
                buttonType = v32.buttonType or v8.Secondary
            }, v32.props);
            if v32.isDefaultChild then
                v26 = v31;
            end;
            if not v17.props.disableGamepadRefs then
                local _ = nil;
                v33 = v4.Dictionary.join(v33, if not v17.props.disableRoactGamepadButtonSelection then {
                    [v3.Ref] = v17.buttonRefs[v31], 
                    NextSelectionUp = (not not v24 and v31 > 1) and v17.buttonRefs[v31 - 1] or nil, 
                    NextSelectionDown = (not not v24 and v31 < #l_buttons_0) and v17.buttonRefs[v31 + 1] or nil, 
                    NextSelectionLeft = (not v24 and v31 > 1) and v17.buttonRefs[v31 - 1] or nil, 
                    NextSelectionRight = (not v24 and v31 < #l_buttons_0) and v17.buttonRefs[v31 + 1] or nil
                } else {
                    [v3.Ref] = v17.buttonRefs[v31]
                });
            end;
            table.insert(v30, v3.createElement(v7, v33));
        end;
        return v3.createElement(v5.Focusable[l_FitFrameOnAxis_0], {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, v22), 
            FillDirection = v25, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            LayoutOrder = 3, 
            minimumSize = UDim2.new(1, 0, 0, v17.props.buttonHeight), 
            [v3.Ref] = v17.props.frameRef, 
            [v3.Change.AbsoluteSize] = v17.updateFrameSize, 
            NextSelectionLeft = v17.props.NextSelectionLeft, 
            NextSelectionRight = v17.props.NextSelectionRight, 
            NextSelectionUp = v17.props.NextSelectionUp, 
            NextSelectionDown = v17.props.NextSelectionDown, 
            defaultChild = not not v26 and v17.buttonRefs[v26] or nil
        }, v30);
    end);
end;
local v37 = v3.forwardRef(function(v35, v36)
    return v3.createElement(v13, v4.Dictionary.join(v35, {
        frameRef = v36
    }));
end);
v37.validateProps = v13.validateProps;
return v37;
