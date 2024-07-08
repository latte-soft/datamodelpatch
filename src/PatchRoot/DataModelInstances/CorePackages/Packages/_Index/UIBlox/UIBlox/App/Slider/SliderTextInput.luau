local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.t);
local l_EventConnection_0 = require(l_Parent_0.ReactUtils).EventConnection;
local v5 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v7 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v8 = require(l_Parent_0.UIBlox.Utility.divideTransparency);
local v9 = v2.PureComponent:extend("SliderTextInput");
v9.validateProps = v3.strictInterface({
    position = v3.optional(v3.union(v3.UDim2, v3.table)), 
    anchorPoint = v3.optional(v3.Vector2), 
    value = v3.number, 
    min = v3.number, 
    max = v3.number, 
    disabled = v3.optional(v3.boolean), 
    stepInterval = v3.numberPositive, 
    onValueChanged = v3.callback, 
    layoutOrder = v3.optional(v3.integer)
});
v9.defaultProps = {
    disabled = false
};
v9.init = function(v10)
    v10.textBoxRef = v2.createRef();
end;
v9.render = function(v11)
    return v7(function(v12)
        local v13 = not v11.props.disabled and 1 or 2;
        return v2.createElement(v5.Label, {
            BackgroundTransparency = 1, 
            Image = v6["component_assets/circle_16"], 
            ImageColor3 = v12.Theme.BackgroundUIContrast.Color, 
            ImageTransparency = v8(v12.Theme.BackgroundUIContrast.Transparency, v13), 
            Position = v11.props.position, 
            AnchorPoint = v11.props.anchorPoint, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.fromOffset(56, 36), 
            SliceCenter = Rect.new(8, 8, 8, 8), 
            LayoutOrder = v11.props.layoutOrder
        }, {
            Border = v2.createElement(v5.Label, {
                BackgroundTransparency = 1, 
                Image = v6["component_assets/circle_17_stroke_1"], 
                ImageColor3 = v12.Theme.Divider.Color, 
                ImageTransparency = v8(v12.Theme.Divider.Transparency, v13), 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.fromScale(1, 1), 
                SliceCenter = Rect.new(8, 8, 8, 8)
            }), 
            TextBox = v2.createElement("TextBox", {
                [v2.Ref] = v11.textBoxRef, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = v12.Font.Body.Font, 
                TextSize = v12.Font.Body.RelativeSize * v12.Font.BaseSize, 
                TextColor3 = v12.Theme.TextDefault.Color, 
                TextTransparency = v8(v12.Theme.TextDefault.Transparency, v13), 
                Size = UDim2.fromScale(1, 1), 
                Text = tostring(v11.props.value), 
                TextScaled = true, 
                TextEditable = not v11.props.disabled, 
                ZIndex = 2, 
                [v2.Event.Focused] = not not v11.props.disabled and function(v14)
                    v14:ReleaseFocus();
                end or nil, 
                [v2.Event.FocusLost] = function(v15, _)
                    local v17 = tonumber(v15.Text);
                    if v17 == nil then
                        v15.Text = tostring(v11.props.value);
                        return ;
                    else
                        v11.props.onValueChanged((math.clamp(math.floor(v17 / v11.props.stepInterval + 0.5) * v11.props.stepInterval, v11.props.min, v11.props.max)));
                        return ;
                    end;
                end
            }, {
                TextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                    MinTextSize = v12.Font.Body.RelativeMinSize * v12.Font.BaseSize, 
                    MaxTextSize = v12.Font.Body.RelativeSize * v12.Font.BaseSize
                })
            }), 
            UserInputConnection = not v11.props.disabled and v2.createElement(l_EventConnection_0, {
                event = l_UserInputService_0.InputBegan, 
                callback = function(v18, _)
                    if v18.UserInputType ~= Enum.UserInputType.Keyboard then
                        return ;
                    elseif l_UserInputService_0:GetFocusedTextBox() ~= v11.textBoxRef.current then
                        return ;
                    else
                        local v20 = 0;
                        if v18.KeyCode == Enum.KeyCode.Up then
                            v20 = 1;
                        elseif v18.KeyCode == Enum.KeyCode.Down then
                            v20 = -1;
                        end;
                        if not (not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) then
                            v20 = v20 * 10;
                        end;
                        if v20 ~= 0 then
                            local v21 = math.clamp(math.floor((v11.props.value + v11.props.stepInterval * v20) / v11.props.stepInterval + 0.5) * v11.props.stepInterval, v11.props.min, v11.props.max);
                            if v21 ~= v11.props.value then
                                v11.props.onValueChanged(v21);
                            end;
                        end;
                        return ;
                    end;
                end
            })
        });
    end);
end;
v9.didMount = function(v22)
    pcall(function()
        v22.textBoxRef.current.TextInputType = Enum.TextInputType.Number;
    end);
end;
return v9;
