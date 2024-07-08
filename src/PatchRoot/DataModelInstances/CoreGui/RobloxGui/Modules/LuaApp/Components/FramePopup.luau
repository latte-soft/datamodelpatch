local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.RoactMotion);
local _ = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v8 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local _ = require(l_Modules_0.LuaApp.Components.LocalizedTextButton);
local v10 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local _ = Enum.Font.SourceSans;
local l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0 = v4.DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT;
local v14 = v2.PureComponent:extend("FramePopup");
v14.defaultProps = {
    enableCancelButton = true, 
    Selectable = false
};
v14.init = function(v15)
    v15.state = {
        hidden = true
    };
    v15.yAnchorPoint = not v15.state.hidden and 1 or 0;
    v15.stiffness = nil;
    v15.damping = nil;
    v15.onRested = nil;
    v15.closeCallback = function()
        v15:close();
    end;
    v15.renderCancelButton = function(v16)
        return v2.createElement("TextButton", {
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            LayoutOrder = 3, 
            BackgroundColor3 = v16.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v16.Theme.BackgroundUIDefault.Transparency, 
            Size = UDim2.new(1, 0, 0, l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0), 
            Text = "", 
            [v2.Event.Activated] = v15.closeCallback
        }, {
            Icon = v2.createElement(v8, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                Image = "LuaApp/icons/navigation/close", 
                ImageColor3 = v16.Theme.IconDefault.Color, 
                ImageTransparency = v16.Theme.IconDefault.Transparency, 
                Position = UDim2.new(0, 20, 0.5, 0), 
                Size = UDim2.new(0, 20, 0, 20)
            }), 
            Cancel = v2.createElement(v10, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundColor3 = v4.Color.WHITE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, 60, 0.5, 0), 
                Size = UDim2.new(1, -70, 1, 0), 
                Text = "Feature.GamePage.LabelCancelField", 
                Font = v16.Font.Body.Font, 
                TextSize = v16.Font.BaseSize * v16.Font.Body.RelativeSize, 
                TextColor3 = v16.Theme.TextDefault.Color, 
                TextTransparency = v16.Theme.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end;
    v15.renderPopupFrame = function(v17, v18)
        local v19 = v15.props[v2.Children];
        local l_enableCancelButton_0 = v15.props.enableCancelButton;
        local l_contentPosition_0 = v15.props.contentPosition;
        local l_screenSize_0 = v15.props.screenSize;
        local v23 = UDim2.new(0, 0, 1, 0);
        if l_contentPosition_0 then
            v23 = UDim2.new(0, 0, 0, l_screenSize_0.Y);
        end;
        return v2.createElement(v5.FitFrame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = v23, 
            AnchorPoint = if not v17.Settings.ReducedMotion then Vector2.new(0, v18.animValue) else Vector2.new(0, 1), 
            BorderSizePixel = 0, 
            fitAxis = v5.FitAxis.Height
        }, {
            UIPadding = l_contentPosition_0 and v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_screenSize_0.X * l_contentPosition_0.X.Scale + l_contentPosition_0.X.Offset), 
                PaddingBottom = UDim.new(0, l_screenSize_0.Y - (l_screenSize_0.Y * l_contentPosition_0.Y.Scale + l_contentPosition_0.Y.Offset))
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            Frame = v2.createElement(v5.FitFrame, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v5.FitAxis.Height
            }, v19), 
            Separator = l_enableCancelButton_0 and v2.createElement("Frame", {
                BackgroundColor3 = v17.Theme.BackgroundUIDefault.Color, 
                BackgroundTransparency = v17.Theme.BackgroundUIDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 1)
            }, {
                SeparatorBar = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = v17.Theme.Divider.Color, 
                    BackgroundTransparency = v17.Theme.Divider.Transparency, 
                    BorderSizePixel = 0
                })
            }), 
            Cancel = l_enableCancelButton_0 and v15.renderCancelButton(v17)
        });
    end;
    v15.onRender = function(v24)
        return l_withStyle_0(function(v25)
            if not v25.Settings.ReducedMotion then
                return v15.renderPopupFrame(v25, v24);
            else
                return v2.createElement("CanvasGroup", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    GroupTransparency = 1 - v24.animValue
                }, {
                    PopupFrame = v15.renderPopupFrame(v25, v24)
                });
            end;
        end);
    end;
end;
v14.open = function(v26)
    v26.yAnchorPoint = 1;
    v26.stiffness = nil;
    v26.damping = nil;
    v26.onRested = nil;
    v26:setState({
        hidden = false
    });
end;
v14.close = function(v27)
    local l_onCancel_0 = v27.props.onCancel;
    v27.yAnchorPoint = 0;
    v27.stiffness = 270;
    v27.damping = nil;
    v27.onRested = l_onCancel_0;
    v27:setState({
        hidden = true
    });
end;
v14.didMount = function(v29)
    v29:open();
end;
v14.render = function(v30)
    return v2.createElement("TextButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Text = "", 
        [v2.Event.Activated] = v30.closeCallback, 
        Selectable = v30.props.Selectable
    }, {
        AnimatedPopup = v2.createElement(v6.SimpleMotion, {
            style = {
                animValue = v6.spring(v30.yAnchorPoint, v30.stiffness, v30.damping)
            }, 
            onRested = v30.onRested, 
            render = v30.onRender
        })
    });
end;
return v3.connect(function(v31, _)
    return {
        screenSize = v31.ScreenSize
    };
end)(v14);
