local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Roact);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_withStyle_0 = v2.Style.withStyle;
local v7 = v3.Component:extend("TextBoxStateWrapper");
v7.defaultProps = {
    IconSize = UDim2.new(1, 0, 1, 0), 
    TextBoxLabelPadding = 12, 
    InnerSidePadding = 0
};
v7.init = function(v8)
    v8:setState({
        Focused = false, 
        Hover = false
    });
    v8.onMouseEnter = function()
        v8:setState({
            Hover = true
        });
    end;
    v8.onMouseLeave = function()
        v8:setState({
            Hover = false
        });
    end;
    v8.onFocused = function(...)
        v8:setState({
            Focused = true
        });
        if v8.props.ChildProps.onFocused then
            v8.props.ChildProps.onFocused(...);
        end;
    end;
    v8.onFocusLost = function(...)
        v8:setState({
            Focused = false
        });
        if v8.props.ChildProps.onFocusLost then
            v8.props.ChildProps.onFocusLost(...);
        end;
    end;
end;
v7.render = function(v9)
    local l_HelpComponent_0 = v9.props.HelpComponent;
    local l_ErrorText_0 = v9.props.ErrorText;
    local l_LabelText_0 = v9.props.LabelText;
    return l_withStyle_0(function(v13)
        local l_Color_0 = v13.Theme.UIDefault.Color;
        local l_Transparency_0 = v13.Theme.UIDefault.Transparency;
        if not v9.props.ErrorState then
            if not v9.state.Focused then
                if v9.state.Hover then
                    l_Color_0 = v13.Theme.IconDefault.Color;
                    l_Transparency_0 = v13.Theme.IconDefault.Transparency;
                end;
            else
                l_Color_0 = v13.Theme.IconEmphasis.Color;
                l_Transparency_0 = v13.Theme.IconEmphasis.Transparency;
            end;
        else
            l_Color_0 = v13.Theme.Alert.Color;
            l_Transparency_0 = v13.Theme.Alert.Transparency;
        end;
        local l_createElement_0 = v3.createElement;
        local v17 = "Frame";
        local v18 = {
            AnchorPoint = v9.props.AnchorPoint, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v9.props.LayoutOrder, 
            Position = v9.props.Position, 
            Size = UDim2.fromScale(1, 0), 
            [v3.Change.AbsolutePosition] = v9.props.onPositionChangedCallback
        };
        local v19 = {
            ListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v9.props.TextBoxLabelPadding)
            }), 
            TextBoxLabel = l_LabelText_0 and v3.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = v13.Font.CaptionHeader.Font, 
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0), 
                Text = l_LabelText_0, 
                TextColor3 = v13.Theme.TextEmphasis.Color, 
                TextSize = v9.props.TextBoxLabelTextSize, 
                TextTransparency = v13.Theme.TextEmphasis.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            TextBox = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = v9.props.Size
            }, {
                Border = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 2, 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(9, 9, 9, 9), 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke", 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = l_Transparency_0
                }), 
                TextBox = v3.createElement(v9.props.ChildClass, v1.Dictionary.join(v9.props.ChildProps, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    onMouseEnter = v9.onMouseEnter, 
                    onMouseLeave = v9.onMouseLeave, 
                    onFocused = v9.onFocused, 
                    onFocusLost = v9.onFocusLost
                })), 
                IconWrapper = v9.props.Icon and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(1, -2, 0, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                }, {
                    AspectRatio = v3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), 
                    Icon = v3.createElement(l_ImageSetLabel_0, {
                        Size = v9.props.IconSize, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = v9.props.Icon, 
                        ImageColor3 = l_Color_0, 
                        ImageTransparency = l_Transparency_0
                    })
                })
            })
        };
        local l_l_ErrorText_0_0 = l_ErrorText_0;
        if l_l_ErrorText_0_0 then
            l_l_ErrorText_0_0 = v3.createElement;
            local v21 = "TextLabel";
            local v22 = {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = v13.Font.CaptionBody.Font, 
                LayoutOrder = 3, 
                Size = UDim2.fromScale(1, 0), 
                Text = l_ErrorText_0, 
                TextColor3 = v13.Theme.Alert.Color, 
                TextSize = v13.Font.CaptionBody.RelativeSize * v13.Font.BaseSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            };
            local v23 = {};
            local v24 = false;
            if v9.props.InnerSidePadding ~= 0 then
                v24 = v3.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, v9.props.InnerSidePadding), 
                    PaddingLeft = UDim.new(0, v9.props.InnerSidePadding)
                });
            end;
            v23.Padding = v24;
            l_l_ErrorText_0_0 = l_l_ErrorText_0_0(v21, v22, v23);
        end;
        v19.ErrorText = l_l_ErrorText_0_0;
        l_l_ErrorText_0_0 = not l_ErrorText_0;
        if l_l_ErrorText_0_0 then
            l_l_ErrorText_0_0 = l_HelpComponent_0;
            if l_l_ErrorText_0_0 then
                l_l_ErrorText_0_0 = v3.createElement;
                local v25 = "Frame";
                local v26 = {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4, 
                    Size = UDim2.fromScale(1, 0)
                };
                local v27 = {};
                local v28 = false;
                if v9.props.InnerSidePadding ~= 0 then
                    v28 = v3.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, v9.props.InnerSidePadding), 
                        PaddingLeft = UDim.new(0, v9.props.InnerSidePadding)
                    });
                end;
                v27.Padding = v28;
                v27.HelpComponent = l_HelpComponent_0;
                l_l_ErrorText_0_0 = l_l_ErrorText_0_0(v25, v26, v27);
            end;
        end;
        v19.HelpComponentWrapper = l_l_ErrorText_0_0;
        return l_createElement_0(v17, v18, v19);
    end);
end;
return v7;
