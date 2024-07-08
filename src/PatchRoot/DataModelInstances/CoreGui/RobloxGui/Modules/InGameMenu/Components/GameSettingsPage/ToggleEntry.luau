local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Components.ToggleSwitch);
local v7 = require(script.Parent.InputLabel);
local v8 = require(script.Parent.DeveloperLockLabel);
local v9 = require(l_Parent_0.Components.ThemedTextLabel);
local v10 = require(l_Parent_0.Localization.withLocalization);
local v11 = l_Roact_0.PureComponent:extend("ToggleEntry");
v11.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    labelKey = l_t_0.string, 
    lockedToOff = l_t_0.optional(l_t_0.boolean), 
    isDisabled = l_t_0.optional(l_t_0.boolean), 
    subtextEnabled = l_t_0.optional(l_t_0.boolean), 
    subtextKey = l_t_0.optional(l_t_0.string), 
    checked = l_t_0.boolean, 
    onToggled = l_t_0.callback, 
    buttonRef = l_t_0.optional(l_t_0.table), 
    NextSelectionUp = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table))
});
v11.init = function(v12)
    v12.state = {
        isSelectable = true
    };
end;
v11.render = function(v13)
    local v14 = v13.props.buttonRef or l_Roact_0.createRef();
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v13.props.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 56), 
        Selectable = v13.state.isSelectable, 
        [l_Roact_0.Event.SelectionGained] = function()
            l_GuiService_0.SelectedCoreObject = v14:getValue();
            v13:setState({
                isSelectable = false
            });
        end
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 30), 
            PaddingLeft = UDim.new(0, 24)
        }), 
        ControlLabel = l_Roact_0.createElement(v7, {
            localizationKey = v13.props.labelKey
        }), 
        LockedLabel = v13.props.lockedToOff and l_Roact_0.createElement(v8, {
            Size = UDim2.new(1, -72, 0.25, 0), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1)
        }), 
        SubtextLabel = v13.props.subtextEnabled and v10({
            text = v13.props.subtextKey
        })(function(v15)
            return l_Roact_0.createElement(v9, {
                Text = v15.text, 
                themeKey = "TextDefault", 
                fontKey = "CaptionBody", 
                TextTransparency = 0.5, 
                Size = UDim2.new(1, -72, 0.25, 0), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Bottom
            });
        end), 
        Toggle = l_Roact_0.createElement(v6, {
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            checked = v13.props.checked and not v13.props.lockedToOff, 
            onToggled = v13.props.onToggled, 
            disabled = v13.props.lockedToOff or v13.props.isDisabled, 
            buttonRef = v14, 
            onSelectionLost = function()
                v13:setState({
                    isSelectable = true
                });
            end, 
            onSelectionGained = function()
                v13:setState({
                    isSelectable = false
                });
            end, 
            NextSelectionUp = v13.props.NextSelectionUp
        })
    });
end;
return v11;
