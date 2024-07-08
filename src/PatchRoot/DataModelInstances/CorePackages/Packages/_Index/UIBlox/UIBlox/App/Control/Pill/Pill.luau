local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v7 = require(l_Parent_0.ImageSet.getIconSize);
local v8 = require(l_Core_0.Style.withStyle);
local v9 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v10 = require(l_Core_0.Control.Enum.ControlState);
local v11 = require(l_Core_0.Control.Interactable);
local v12 = require(l_Core_0.Button.getContentStyle);
local v13 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v14 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v15 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v16 = require(l_Parent_1.Core.Text.GetTextSize);
local v17 = v4.PureComponent:extend("Pill");
v17.validateProps = v5.strictInterface({
    text = v5.optional(v5.string), 
    isSelected = v5.optional(v5.boolean), 
    isDisabled = v5.optional(v5.boolean), 
    isLoading = v5.optional(v5.boolean), 
    icon = v5.union(v5.string, v9), 
    onActivated = v5.callback
});
v17.defaultProps = {
    text = "", 
    isSelected = false, 
    isDisabled = false, 
    isLoading = false
};
v17.init = function(v18)
    v18.state = {
        controlState = v10.Initialize
    };
end;
v17.render = function(v19)
    return v8(function(v20)
        local l_Font_0 = v20.Font;
        local l_isSelected_0 = v19.props.isSelected;
        local l_isDisabled_0 = v19.props.isDisabled;
        local l_isLoading_0 = v19.props.isLoading;
        local l_icon_0 = v19.props.icon;
        local l_text_0 = v19.props.text;
        local l_onActivated_0 = v19.props.onActivated;
        local v28 = {
            [v10.Default] = not l_isSelected_0 and "IconDefault" or "SystemPrimaryContent", 
            [v10.Hover] = not l_isSelected_0 and "IconEmphasis" or "SystemPrimaryContent"
        };
        local v29 = {
            [v10.Default] = not l_isSelected_0 and "TextDefault" or "SystemPrimaryContent", 
            [v10.Hover] = not l_isSelected_0 and "TextEmphasis" or "SystemPrimaryContent"
        };
        local v30 = {
            [v10.Default] = not l_isSelected_0 and "BackgroundUIDefault" or "SystemPrimaryDefault", 
            [v10.Hover] = not l_isSelected_0 and "BackgroundUIDefault" or "SystemPrimaryOnHover"
        };
        local v31 = v12(v28, v19.state.controlState, v20);
        local v32 = v12(v29, v19.state.controlState, v20);
        local v33 = v12(v30, v19.state.controlState, v20);
        local v34 = v7(v6.Small);
        local v35 = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize;
        local l_X_0 = v16(l_text_0, v35, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
        local v37 = l_X_0 + 24;
        local v38 = 240 - (28 + v34);
        local v39;
        if not l_isLoading_0 then
            v39 = v4.createElement;
            local l_v11_0 = v11;
            local v43 = {
                Size = UDim2.new(0, (v37 + 4) + v34, 0, 28), 
                BackgroundColor3 = v33.Color, 
                BackgroundTransparency = v33.Transparency, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                isDisabled = l_isDisabled_0, 
                [v4.Event.Activated] = not l_isLoading_0 and l_onActivated_0 or nil, 
                onStateChanged = function(_, v42)
                    v19:setState({
                        controlState = v42
                    });
                end
            };
            local v44 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                })
            };
            local l_createElement_0 = v4.createElement;
            local v46 = "Frame";
            local v47 = {
                Size = UDim2.new(0, (l_X_0 + 4) + v34, 1, 0), 
                ClipsDescendants = true, 
                BackgroundTransparency = 1
            };
            local v48 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, 4), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Icon = v4.createElement(v14.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromOffset(v34, v34), 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = v31.Color, 
                    ImageTransparency = v31.Transparency
                })
            };
            local v49 = false;
            if string.len(l_text_0) > 0 then
                v49 = v4.createElement("Frame", {
                    Size = UDim2.fromOffset(l_X_0, v35), 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1
                }, {
                    PillText = v4.createElement(v13, {
                        Text = l_text_0, 
                        BackgroundTransparency = 1, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        colorStyle = v32, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Size = UDim2.fromOffset(v38, v35), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        [v4.Ref] = v19.PillText
                    }); 
                    v4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v38, 28)
                    })
                });
            end;
            v48.TextArea = v49;
            v48.UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(216, 28)
            });
            v44.Content = l_createElement_0(v46, v47, v48);
            v44.UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            });
            v44.UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(240, 28)
            });
            v39 = v39(l_v11_0, v43, v44);
            if v39 then
                goto label0;
            end;
        end;
        v39 = v4.createElement(v15, {
            Size = UDim2.new(0, (v37 + 4) + v34, 0, 28), 
            cornerRadius = UDim.new(1, 0)
        });
        ::label0::;
        return v39;
    end);
end;
return v17;
