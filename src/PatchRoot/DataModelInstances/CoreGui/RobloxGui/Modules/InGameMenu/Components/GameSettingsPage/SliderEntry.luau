local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(script.Parent.InputLabel);
local v7 = require(l_Parent_0.Components.SliderWithInput);
local v8 = l_Roact_0.PureComponent:extend("SliderEntry");
v8.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    labelKey = l_t_0.string, 
    min = l_t_0.number, 
    max = l_t_0.number, 
    stepInterval = l_t_0.number, 
    keyboardInputStepInterval = l_t_0.optional(l_t_0.numberPositive), 
    value = l_t_0.number, 
    disabled = l_t_0.optional(l_t_0.boolean), 
    valueChanged = l_t_0.callback, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean), 
    buttonRef = l_t_0.optional(l_t_0.table)
});
v8.init = function(v9)
    v9.state = {
        isFrameSelectable = true
    };
end;
v8.render = function(v10)
    local v11 = v10.props.buttonRef or l_Roact_0.createRef();
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 92), 
        LayoutOrder = v10.props.LayoutOrder, 
        Selectable = v10.state.isFrameSelectable, 
        [l_Roact_0.Event.SelectionGained] = function()
            l_GuiService_0.SelectedCoreObject = v11:getValue();
            v10:setState({
                isFrameSelectable = false
            });
        end
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 30), 
            PaddingBottom = UDim.new(0, 24)
        }), 
        Label = l_Roact_0.createElement(v6, {
            Size = UDim2.new(1, 0, 0, 24), 
            localizationKey = v10.props.labelKey, 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0)
        }), 
        Slider = l_Roact_0.createElement(v7, {
            min = v10.props.min, 
            max = v10.props.max, 
            stepInterval = v10.props.stepInterval, 
            keyboardInputStepInterval = v10.props.keyboardInputStepInterval, 
            value = v10.props.value, 
            Position = UDim2.new(0, 0, 0, 32), 
            disabled = v10.props.disabled, 
            valueChanged = v10.props.valueChanged, 
            canCaptureFocus = v10.props.canCaptureFocus, 
            isMenuOpen = v10.props.isMenuOpen, 
            sliderDotRef = v11, 
            onSelectionLost = function()
                v10:setState({
                    isFrameSelectable = true
                });
            end, 
            onSelectionGained = function()
                v10:setState({
                    isFrameSelectable = false
                });
            end
        })
    });
end;
return v8;
