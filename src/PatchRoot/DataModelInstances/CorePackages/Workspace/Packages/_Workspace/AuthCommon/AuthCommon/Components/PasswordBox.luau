local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v9 = require(l_script_FirstAncestor_0.Utils.AreaTest);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_GetFFlagLuaAppFixSelectionCursor_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppFixSelectionCursor;
local l_GetFFlagEnableTextFieldContentType_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableTextFieldContentType;
local v14 = game:DefineFastFlag("EnableKeyboardVisibilityCheckOnPasswordFocus", false);
local v15 = v4.PureComponent:extend("PasswordBox");
v15.init = function(v16)
    v16.state = {
        hidePassword = true, 
        containerSize = Vector2.new(0, 0)
    };
    v16.getHidePassword = function()
        if v16.props.hidePassword ~= nil then
            return v16.props.hidePassword;
        else
            return v16.state.hidePassword;
        end;
    end;
    v16.isMounted = false;
    v16.passwordBoxRef = v4.createRef();
    local v17 = v4.createRef();
    v16.getPasswordTextBoxRef = function()
        return v16.props.TextBoxRef or v17;
    end;
    v16.isTouchPositionInPasswordBox = function(v18)
        if v16.passwordBoxRef.current then
            local l_AbsolutePosition_0 = v16.passwordBoxRef.current.AbsolutePosition;
            return v9.IsPointInRect(Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + v16.passwordBoxRef.current.AbsoluteSize), v18);
        else
            return false;
        end;
    end;
    v16.tapBeganInTextbox = false;
    v16.tapEventBegan = function(v20, _)
        if not (not v16.props.CentralOverlayBlocksInput or not v16.props.centralOverlay) and v16.props.centralOverlay.OverlayType ~= nil then
            return ;
        elseif not v14 or l_UserInputService_0.OnScreenKeyboardVisible then
            v16.tapBeganInTextbox = v16.isTouchPositionInPasswordBox(v20);
            local l_current_0 = v16.getPasswordTextBoxRef().current;
            local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
            if not ((not (l_current_0 and l_l_UserInputService_0_FocusedTextBox_0 ~= l_current_0) or not v16.tapBeganInTextbox) or not v16.props.CaptureFocusOnTapStart) then
                if l_l_UserInputService_0_FocusedTextBox_0 then
                    l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
                end;
                l_current_0:CaptureFocus();
            end;
            return ;
        else
            return ;
        end;
    end;
    v16.tapEventEnded = function(v24, _)
        if not v16.tapBeganInTextbox then
            local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
            local l_current_1 = v16.getPasswordTextBoxRef().current;
            if not l_l_UserInputService_0_FocusedTextBox_1 or l_l_UserInputService_0_FocusedTextBox_1 ~= l_current_1 then
                return ;
            else
                if not v16.isTouchPositionInPasswordBox(v24) then
                    l_current_1:ReleaseFocus();
                end;
                return ;
            end;
        else
            v16.tapBeganInTextbox = false;
            return ;
        end;
    end;
    v16.onAbsoluteSizeChanged = function(v28)
        local l_containerSize_0 = v16.state.containerSize;
        local l_AbsoluteSize_0 = v28.AbsoluteSize;
        if (l_AbsoluteSize_0.X > 0 and l_AbsoluteSize_0.Y > 0) and l_containerSize_0 ~= l_AbsoluteSize_0 then
            spawn(function()
                if v16.isMounted then
                    v16:setState({
                        containerSize = l_AbsoluteSize_0
                    });
                end;
            end);
        end;
    end;
    v16.onTogglerActivated = function(_)
        local l_onToggleCallback_0 = v16.props.onToggleCallback;
        local v33 = v16.getHidePassword();
        if l_onToggleCallback_0 then
            l_onToggleCallback_0(v33);
        end;
        if v16.isMounted then
            v16:setState({
                hidePassword = not v33
            });
        end;
    end;
    v16.shouldTakeInput = function(v34)
        if not v16.props.Disabled then
            local v35 = true;
            if v34.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v35 = v34.UserInputType == Enum.UserInputType.Touch;
            end;
            return not v16.props.ManualFocusRelease and v35;
        else
            return false;
        end;
    end;
end;
v15.defaultProps = {
    TextXAlignment = Enum.TextXAlignment.Left, 
    PaddingX = 10, 
    PaddingY = 7, 
    ClearTextOnFocus = false, 
    IsKeyboardOverlayUsed = true
};
v15.didMount = function(v36)
    v36.isMounted = true;
    if v36.props.IsKeyboardOverlayUsed then
        v36.inputBeganConnection = l_UserInputService_0.InputBegan:connect(function(v37, v38)
            if v36.shouldTakeInput(v37) then
                v36.tapEventBegan(v37.Position, v38);
            end;
        end);
        v36.inputEndedConnection = l_UserInputService_0.InputEnded:connect(function(v39, v40)
            if v36.shouldTakeInput(v39) then
                v36.tapEventEnded(v39.Position, v40);
            end;
        end);
    end;
end;
v15.willUnmount = function(v41)
    v41.isMounted = false;
    if v41.props.IsKeyboardOverlayUsed then
        if v41.inputBeganConnection then
            v41.inputBeganConnection:disconnect();
        end;
        if v41.inputEndedConnection then
            v41.inputEndedConnection:disconnect();
        end;
    end;
end;
v15.render = function(v42)
    if not l_GetFFlagLuaAppFixSelectionCursor_0() then
        return v42:renderWithSelectionCursor(nil);
    else
        return l_withSelectionCursorProvider_0(function(v43)
            return v42:renderWithSelectionCursor(v43);
        end);
    end;
end;
v15.renderWithSelectionCursor = function(v44, v45)
    local l_Size_0 = v44.props.Size;
    local l_Position_0 = v44.props.Position;
    local l_LayoutOrder_0 = v44.props.LayoutOrder;
    local l_Text_0 = v44.props.Text;
    local l_TextSize_0 = v44.props.TextSize;
    local l_PlaceholderText_0 = v44.props.PlaceholderText;
    local l_TextXAlignment_0 = v44.props.TextXAlignment;
    local l_TextColor_0 = v44.props.TextColor;
    local l_PlaceholderColor_0 = v44.props.PlaceholderColor;
    local l_ClearTextOnFocus_0 = v44.props.ClearTextOnFocus;
    local l_Color_0 = v44.props.Color;
    local l_Transparency_0 = v44.props.Transparency;
    local l_TextTransparency_0 = v44.props.TextTransparency;
    local l_ReturnKeyType_0 = v44.props.ReturnKeyType;
    local l_NextSelectionDown_0 = v44.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v44.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v44.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v44.props.NextSelectionUp;
    local l_PaddingX_0 = v44.props.PaddingX;
    local l_PaddingY_0 = v44.props.PaddingY;
    local v66 = v44.getHidePassword();
    local l_Y_0 = v44.state.containerSize.Y;
    local l_onFocused_0 = v44.props.onFocused;
    local l_onFocusLost_0 = v44.props.onFocusLost;
    local l_onMouseEnter_0 = v44.props.onMouseEnter;
    local l_onMouseLeave_0 = v44.props.onMouseLeave;
    local v72 = not not l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.PasswordShown or Enum.TextInputType.NoSuggestions;
    return l_withStyle_0(function(v73)
        local v74 = nil;
        if l_GetFFlagLuaAppFixSelectionCursor_0() then
            v74 = v45(l_CursorKind_0.InputButton);
        end;
        return v4.createElement(l_ImageSetLabel_0, {
            Size = l_Size_0, 
            Position = l_Position_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
            ImageColor3 = l_Color_0, 
            ImageTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            [v4.Ref] = v44.passwordBoxRef, 
            [v4.Change.AbsoluteSize] = v44.onAbsoluteSizeChanged
        }, {
            TextBoxContainer = v4.createElement("Frame", {
                Size = UDim2.new(1, -l_Y_0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                TextBox = v4.createElement("TextBox", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Text = l_Text_0, 
                    PlaceholderText = l_PlaceholderText_0, 
                    PlaceholderColor3 = l_PlaceholderColor_0, 
                    Font = v73.Font.Body.Font, 
                    TextSize = l_TextSize_0, 
                    TextColor3 = l_TextColor_0, 
                    TextTransparency = l_TextTransparency_0, 
                    TextXAlignment = l_TextXAlignment_0, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = l_ClearTextOnFocus_0, 
                    OverlayNativeInput = true, 
                    ManualFocusRelease = v44.props.IsKeyboardOverlayUsed, 
                    ClipsDescendants = true, 
                    TextInputType = not not v66 and Enum.TextInputType.Password or v72, 
                    ReturnKeyType = l_ReturnKeyType_0, 
                    NextSelectionDown = l_NextSelectionDown_0, 
                    NextSelectionLeft = l_NextSelectionLeft_0, 
                    NextSelectionRight = l_NextSelectionRight_0, 
                    NextSelectionUp = l_NextSelectionUp_0, 
                    SelectionImageObject = v74, 
                    [v4.Ref] = v44.getPasswordTextBoxRef(), 
                    [v4.Change.Text] = v44.props.onChangeText, 
                    [v4.Event.ReturnPressedFromOnScreenKeyboard] = v44.props.onReturnPressedFromOnScreenKeyboard, 
                    [v4.Event.Focused] = l_onFocused_0, 
                    [v4.Event.FocusLost] = l_onFocusLost_0, 
                    [v4.Event.MouseEnter] = l_onMouseEnter_0, 
                    [v4.Event.MouseLeave] = l_onMouseLeave_0
                }), 
                UIPadding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_PaddingY_0), 
                    PaddingBottom = UDim.new(0, l_PaddingY_0), 
                    PaddingLeft = UDim.new(0, l_PaddingX_0), 
                    PaddingRight = UDim.new(0, l_PaddingX_0)
                })
            }), 
            Toggler = v4.createElement("TextButton", {
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, l_Y_0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Text = "", 
                BackgroundTransparency = 1, 
                SelectionImageObject = v74, 
                [v4.Event.Activated] = v44.onTogglerActivated
            }, {
                ImageLabel = v4.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = if not v66 then l_GetImageData_0("LuaApp/icons/actions_edit_hide") or "LuaApp/icons/actions_edit_hide" else l_GetImageData_0("LuaApp/icons/actions_privacy_show") or "LuaApp/icons/actions_privacy_show", 
                    ImageColor3 = v73.Theme.UIDefault.Color, 
                    ImageTransparency = v73.Theme.UIDefault.Transparency
                })
            })
        });
    end);
end;
return (v3.connect(function(v75, _)
    return {
        centralOverlay = v75.CentralOverlay
    };
end)(v15));
