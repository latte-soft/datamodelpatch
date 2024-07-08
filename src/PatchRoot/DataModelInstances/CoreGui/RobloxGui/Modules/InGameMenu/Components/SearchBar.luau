local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_UIBlox_0 = v2.UIBlox;
local l_Cryo_0 = v2.Cryo;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v10 = require(script.Parent.Parent.Localization.withLocalization);
local v11 = l_Roact_0.PureComponent:extend("SearchBar");
v11.validateProps = l_t_0.interface({
    size = l_t_0.UDim2, 
    text = l_t_0.optional(l_t_0.string), 
    onTextChanged = l_t_0.optional(l_t_0.callback), 
    onFocused = l_t_0.optional(l_t_0.callback), 
    onCancelled = l_t_0.optional(l_t_0.callback), 
    onFocusLost = l_t_0.optional(l_t_0.callback), 
    autoCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    zIndex = l_t_0.optional(l_t_0.number), 
    visible = l_t_0.optional(l_t_0.boolean)
});
v11.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    autoCaptureFocus = false, 
    visible = true
};
v11.init = function(v12)
    v12.textboxRef = l_Roact_0.createRef();
    v12.onAbsoluteSizeChanged = function(v13)
        local v14 = false;
        if v12.width ~= v13.AbsoluteSize.X then
            v12.width = v13.AbsoluteSize.X;
            v14 = true;
        end;
        if v12.height ~= v13.AbsoluteSize.Y then
            v12.height = v13.AbsoluteSize.Y;
            v14 = true;
        end;
        if v14 then
            v12:setState({
                width = v12.width - 2, 
                height = v12.height - 2
            });
        end;
    end;
    v12.searchTextChanged = function(v15)
        if v12.props.onTextChanged then
            v12.props.onTextChanged(v15.Text);
        end;
    end;
    v12.searchBoxFocused = function(_)
        if v12.props.onFocused then
            v12.props.onFocused();
        end;
    end;
    v12.searchCancel = function()
        if v12.props.onCancelled then
            v12.props.onCancelled();
        end;
    end;
    v12.onFocusLost = function()
        if v12.props.onFocusLost then
            v12.props.onFocusLost();
        end;
    end;
    v12.onTextboxTouchTap = function()
        if v12.props.onTextboxTouchTap then
            v12.props.onTextboxTouchTap();
        end;
    end;
end;
v11.willUpdate = function(v17, v18)
    if not (not (v17.props.autoCaptureFocus and v17.props.visible == false) or not v18.visible) then
        v17:focus();
    end;
end;
v11.didMount = function(v19)
    if not (not v19.props.autoCaptureFocus or not v19.props.visible) then
        v19:focus();
    end;
end;
v11.focus = function(v20)
    if v20.textboxRef then
        v20.textboxRef.current:CaptureFocus();
    end;
end;
v11.render = function(v21)
    return l_withStyle_0(function(v22)
        return v10({
            search = "CoreScripts.InGameMenu.InviteFriends.Search", 
            cancel = "CoreScripts.InGameMenu.Cancel"
        })(function(v23)
            local l_Body_0 = v22.Font.Body;
            local v25 = v22.Font.BaseSize * l_Body_0.RelativeSize;
            local l_Body_1 = v22.Font.Body;
            return l_Roact_0.createElement("CanvasGroup", {
                BackgroundTransparency = 1, 
                GroupTransparency = 0.5, 
                Size = v21.props.size, 
                ZIndex = v21.props.zIndex, 
                Visible = v21.props.visible, 
                [l_Roact_0.Ref] = v21.props.forwardRef or l_Roact_0.createRef()
            }, {
                SearchPanelLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 9)
                }), 
                SearchBorder = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, -66, 0, 38), 
                    BackgroundColor3 = Color3.new(136, 136, 136), 
                    BackgroundTransparency = 0.8, 
                    [l_Roact_0.Change.AbsoluteSize] = v21.onAbsoluteSizeChanged
                }, {
                    BorderRadius = l_Roact_0.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    SearchContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.fromOffset(v21.state.width, v21.state.height), 
                        BackgroundColor3 = Color3.new(0, 0, 0), 
                        Position = UDim2.fromOffset(1, 1)
                    }, {
                        SearchContainerLayout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 10)
                        }), 
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 12), 
                            PaddingRight = UDim.new(0, 12)
                        }), 
                        BorderRadius = l_Roact_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        }), 
                        SearchImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/common/search_small"], 
                            Size = UDim2.fromOffset(18, 18)
                        }), 
                        SearchInput = l_Roact_0.createElement("TextBox", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -28, 0, 20), 
                            Font = l_Body_1.Font, 
                            Text = v21.props.text or "", 
                            TextInputType = if l_UserInputService_0:GetPlatform() == Enum.Platform.Android then Enum.TextInputType.PasswordShown else Enum.TextInputType.NoSuggestions, 
                            TextSize = v22.Font.BaseSize * l_Body_1.RelativeSize, 
                            TextColor3 = v22.Theme.TextEmphasis.Color, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            PlaceholderText = v23.search, 
                            PlaceholderColor3 = v22.Theme.TextDefault.Color, 
                            ClearTextOnFocus = false, 
                            ClipsDescendants = true, 
                            [l_Roact_0.Change.Text] = v21.searchTextChanged, 
                            [l_Roact_0.Event.Focused] = v21.searchBoxFocused, 
                            [l_Roact_0.Event.FocusLost] = v21.onFocusLost, 
                            [l_Roact_0.Ref] = v21.textboxRef, 
                            [l_Roact_0.Event.TouchTap] = v21.onTextboxTouchTap
                        })
                    })
                }), 
                CancelButton = l_Roact_0.createElement("TextButton", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(57, 20), 
                    Font = l_Body_0.Font, 
                    TextSize = v25, 
                    Text = v23.cancel, 
                    TextColor3 = v22.Theme.TextEmphasis.Color, 
                    [l_Roact_0.Event.Activated] = v21.searchCancel
                })
            });
        end);
    end);
end;
return l_Roact_0.forwardRef(function(v27, v28)
    return l_Roact_0.createElement(v11, l_Cryo_0.Dictionary.join(v27, {
        forwardRef = v28
    }));
end);
