local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_UIBlox_0 = v4.UIBlox;
local l_Cryo_0 = v4.Cryo;
local l_t_0 = v4.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v12 = require(script.Parent.Parent.Utility.ExternalEventConnection);
local v13 = require(script.Parent.Connection.FocusHandler);
local v14 = require(script.Parent.Slider);
local v15 = require(script.Parent.AssetImage);
local v16 = l_Roact_0.PureComponent:extend("SliderWithInput");
v16.defaultProps = {
    width = UDim.new(1, 0)
};
v16.validateProps = l_t_0.intersection(l_t_0.strictInterface({
    min = l_t_0.number, 
    max = l_t_0.number, 
    stepInterval = l_t_0.numberPositive, 
    keyboardInputStepInterval = l_t_0.optional(l_t_0.numberPositive), 
    value = l_t_0.number, 
    valueChanged = l_t_0.callback, 
    disabled = l_t_0.optional(l_t_0.boolean), 
    width = l_t_0.optional(l_t_0.UDim), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean), 
    sliderDotRef = l_t_0.optional(l_t_0.table), 
    onSelectionLost = l_t_0.callback, 
    onSelectionGained = l_t_0.callback
}), function(v17)
    if v17.max < v17.min then
        return false, "min must be less than or equal to max";
    elseif not (v17.max >= v17.value) or v17.value < v17.min then
        return false, "value must be within min and max";
    else
        return true;
    end;
end);
v16.init = function(v18)
    v18.textBoxRef = l_Roact_0.createRef();
    v18.state = {
        textEntryMode = false
    };
end;
v16.renderFocusHandler = function(v19)
    return l_Roact_0.createElement(v13, {
        isFocused = not not v19.props.canCaptureFocus and (v19.state.textEntryMode or false), 
        didFocus = function()
            l_GuiService_0.CoreGuiNavigationEnabled = false;
            local l_value_0 = v19.props.value;
            l_ContextActionService_0:BindCoreAction("LeaveTextEntryMode", function(_, v22)
                if v22 == Enum.UserInputState.End then
                    v19:setState({
                        textEntryMode = false
                    });
                    local l_current_0 = v19.textBoxRef.current;
                    l_current_0.Text = l_value_0;
                    l_current_0:ReleaseFocus();
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end, 
        didBlur = function()
            l_GuiService_0.CoreGuiNavigationEnabled = true;
            l_ContextActionService_0:UnbindCoreAction("LeaveTextEntryMode");
        end
    }) or nil;
end;
v16.renderWithSelectionCursor = function(v24, v25)
    local l_props_0 = v24.props;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(l_props_0.width.Scale, l_props_0.width.Offset, 0, 36), 
        Position = l_props_0.Position, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Slider = l_Roact_0.createElement(v14, (l_Cryo_0.Dictionary.join(l_props_0, {
            width = UDim.new(1, -80), 
            LayoutOrder = l_Cryo_0.None, 
            Position = l_Cryo_0.None, 
            AnchorPoint = l_Cryo_0.None, 
            keyboardInputStepInterval = l_Cryo_0.None, 
            NextSelectionRight = v24.textBoxRef
        }))), 
        TextContainer = l_withStyle_0(function(v27)
            local v28 = not not l_props_0.disabled and v27.Theme.TextMuted or v27.Theme.TextDefault;
            return l_Roact_0.createElement(v15.Label, {
                BackgroundTransparency = 1, 
                imageKey = "RoundedRect", 
                ImageTransparency = v27.Theme.BackgroundUIContrast.Transparency, 
                ImageColor3 = v27.Theme.BackgroundUIContrast.Color, 
                Size = UDim2.new(0, 64, 0, 36), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            }, {
                FocusHandler = v24:renderFocusHandler(), 
                Box = l_Roact_0.createElement("TextBox", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Font = v27.Font.Body.Font, 
                    TextScaled = true, 
                    ClearTextOnFocus = false, 
                    TextEditable = not l_props_0.disabled, 
                    TextColor3 = v28.Color, 
                    TextTransparency = v28.Transparency, 
                    Text = tostring(l_props_0.value), 
                    NextSelectionLeft = v24.props.sliderDotRef, 
                    SelectionImageObject = v25(l_CursorKind_0.InputFields), 
                    [l_Roact_0.Event.SelectionLost] = v24.props.onSelectionLost, 
                    [l_Roact_0.Event.SelectionGained] = v24.props.onSelectionGained, 
                    [l_Roact_0.Ref] = v24.textBoxRef, 
                    [l_Roact_0.Event.Focused] = not not l_props_0.disabled and function(v29)
                        v29:ReleaseFocus(false);
                    end or function()
                        v24:setState({
                            textEntryMode = true
                        });
                    end, 
                    [l_Roact_0.Event.FocusLost] = function(v30, _)
                        v24:setState({
                            textEntryMode = false
                        });
                        local v32 = tonumber(v30.Text);
                        if v32 ~= l_props_0.value then
                            if v32 == nil then
                                v30.Text = tostring(l_props_0.value);
                                return ;
                            else
                                local l_stepInterval_0 = l_props_0.stepInterval;
                                if l_props_0.keyboardInputStepInterval then
                                    l_stepInterval_0 = l_props_0.keyboardInputStepInterval;
                                end;
                                local v34 = math.clamp(math.floor(v32 / l_stepInterval_0 + 0.5) * l_stepInterval_0, l_props_0.min, l_props_0.max);
                                v30.Text = tostring(v34);
                                if v34 ~= l_props_0.value then
                                    l_props_0.valueChanged(v34);
                                end;
                            end;
                        end;
                    end
                }, {
                    TextSizeConstraint = l_Roact_0.createElement("UITextSizeConstraint", {
                        MinTextSize = v27.Font.Body.RelativeMinSize * v27.Font.BaseSize, 
                        MaxTextSize = v27.Font.Body.RelativeSize * v27.Font.BaseSize
                    })
                })
            });
        end), 
        UserInputConnection = not l_props_0.disabled and l_Roact_0.createElement(v12, {
            event = l_UserInputService_0.InputBegan, 
            callback = function(v35, _)
                if v35.UserInputType ~= Enum.UserInputType.Keyboard then
                    return ;
                elseif l_UserInputService_0:GetFocusedTextBox() ~= v24.textBoxRef.current then
                    return ;
                else
                    local v37 = 0;
                    if v35.KeyCode == Enum.KeyCode.Up then
                        v37 = 1;
                    elseif v35.KeyCode == Enum.KeyCode.Down then
                        v37 = -1;
                    end;
                    if not (not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) then
                        v37 = v37 * 10;
                    end;
                    if v37 ~= 0 then
                        local v38 = math.clamp(math.floor((l_props_0.value + l_props_0.stepInterval * v37) / l_props_0.stepInterval + 0.5) * l_props_0.stepInterval, l_props_0.min, l_props_0.max);
                        if v38 ~= l_props_0.value then
                            l_props_0.valueChanged(v38);
                        end;
                    end;
                    return ;
                end;
            end
        })
    });
end;
v16.render = function(v39)
    return l_withSelectionCursorProvider_0(function(v40)
        return v39:renderWithSelectionCursor(v40);
    end);
end;
return v16;
