local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local _ = v7.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Style.withStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local v13 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v15 = l_Images_0["component_assets/circle_17_stroke_1"];
local v16 = Rect.new(8, 8, 8, 8);
local v17 = v3.PureComponent:extend("PromptWithTextField");
v17.validateProps = v6.strictInterface({
    fieldText = v6.string, 
    onFieldTextUpdated = v6.callback, 
    title = v6.string, 
    bodyText = v6.optional(v6.string), 
    buttonStackInfo = v6.table, 
    screenSize = v6.Vector2
});
v17.init = function(v18)
    v18:setState({
        alertPosition = UDim2.fromScale(0.5, 0.5)
    });
    v18.textBoxRef = v3.createRef();
    v18.textUpdated = function(v19)
        v18.props.onFieldTextUpdated(v19.Text);
    end;
    v18.lastAlertHeight = 100;
    v18.calculateAlertPosition = function()
        local v20 = UDim2.fromScale(0.5, 0.5);
        if l_UserInputService_0.OnScreenKeyboardVisible then
            local v21 = (v18.props.screenSize.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2;
            local v22 = v21 - v18.lastAlertHeight / 2;
            if v22 < 20 then
                v21 = v21 + (20 - v22);
            end;
            v20 = UDim2.new(0.5, 0, 0, v21);
        end;
        if v18.state.alertPosition ~= v20 then
            v18:setState({
                alertPosition = v20
            });
        end;
    end;
    v18.alertSizeChanged = function(v23)
        v18.lastAlertHeight = v23.AbsoluteSize.Y;
        v18.calculateAlertPosition();
    end;
    v18.alertMounted = function()
        local v24 = v18.textBoxRef:getValue();
        if v24 then
            v24:CaptureFocus();
        end;
    end;
end;
v17.renderAlertMiddleContent = function(v25)
    return l_withStyle_0(function(v26)
        local l_Font_0 = v26.Font;
        local l_Theme_0 = v26.Theme;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 35), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        }, {
            TextboxBorder = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v15, 
                ImageColor3 = l_Theme_0.UIDefault.Color, 
                ImageTransparency = l_Theme_0.UIDefault.Transparency, 
                LayoutOrder = 3, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 1, -5), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                SliceCenter = v16
            }, {
                Textbox = v3.createElement(v5.Focusable.TextBox, {
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = l_Font_0.Header2.Font, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                    PlaceholderColor3 = l_Theme_0.TextDefault.Color, 
                    PlaceholderText = v13:FormatByKey("CoreScripts.AvatarEditorPrompts.OutfitNamePlaceholder"), 
                    Position = UDim2.new(0, 6, 0, 0), 
                    Size = UDim2.new(1, -12, 1, 0), 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Text = v25.props.fieldText, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    OverlayNativeInput = true, 
                    [v3.Change.Text] = v25.textUpdated, 
                    [v3.Ref] = v25.textBoxRef
                })
            })
        });
    end);
end;
v17.render = function(v29)
    return v3.createFragment({
        InteractiveAlert = v3.createElement(l_InteractiveAlert_0, {
            title = v29.props.title, 
            bodyText = v29.props.bodyText, 
            buttonStackInfo = v29.props.buttonStackInfo, 
            position = v29.state.alertPosition, 
            screenSize = v29.props.screenSize, 
            middleContent = function()
                return v29:renderAlertMiddleContent();
            end, 
            isMiddleContentFocusable = true, 
            onAbsoluteSizeChanged = v29.alertSizeChanged, 
            onMounted = v29.alertMounted
        }), 
        OnScreenKeyboardVisibleConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"), 
            callback = v29.calculateAlertPosition
        }), 
        OnScreenKeyboardSizeConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardSize"), 
            callback = v29.calculateAlertPosition
        })
    });
end;
v17.didMount = function(v30)
    v30.calculateAlertPosition();
end;
return v4.connect(function(v31)
    return {
        screenSize = v31.screenSize
    };
end, nil)(v17);
