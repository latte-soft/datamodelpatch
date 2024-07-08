local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v11 = require(l_script_FirstAncestor_0.Components.LeftFlexRowLayout);
local v12 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v5.Core.ImageSet.ImageSetButton;
local v16 = {
    clear = l_Images_0["icons/actions/edit/clear_small"], 
    search = l_Images_0["icons/common/search_small"]
};
local v17 = {
    cancelButtonText = "Feature.Catalog.Action.Cancel", 
    placeholder = "Feature.Catalog.Search.Placeholder"
};
local function v19(v18)
    return {
        borderRadius = v18.Semantic.Radius.Medium, 
        cancelButtonPadding = v18.Global.Space_100, 
        defaultHeight = v18.Global.Size_450, 
        font = v18.Semantic.Typography.Body.Font, 
        iconAndTextInputMargin = v18.Global.Space_200, 
        iconOffsetX = v18.Global.Size_150, 
        iconSize = v18.Global.Size_200, 
        inputAndCancelButtonMargin = v18.Global.Space_100, 
        inputBackgroundColor = v18.Semantic.Color.Background.Contrast.Color3, 
        placeholderColor = v18.Semantic.Color.Common.Placeholder.Color3, 
        textIconColor = v18.Semantic.Color.Text.Emphasis.Color3, 
        textIconTransparency = v18.Semantic.Color.Text.Emphasis.Transparency, 
        textSize = v18.Semantic.Typography.Body.FontSize
    };
end;
return function(v20)
    local v21 = l_useLocalization_0(v17);
    local v22 = l_useDesignTokens_0(v19);
    local v23 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v24, v25 = v4.useState(false);
    local v26 = v4.useRef(nil);
    local v27 = v20.height or v22.defaultHeight;
    local v28 = v20.placeholder or v21.placeholder;
    local v29 = v22.iconSize + 2 * v22.iconOffsetX;
    local v30 = -v29 + (not v24 and 0 or -v29);
    local v31 = -(v22.iconSize + v22.iconOffsetX);
    v4.useEffect(function()
        if not ((not v20.autofocus or not v26.current) or v26.current:IsFocused()) then
            v26.current:CaptureFocus();
        end;
    end, {
        v20.autofocus
    });
    return v4.createElement(v11, {
        margin = v22.inputAndCancelButtonMargin, 
        flexSlot = v4.createElement("Frame", {
            BackgroundColor3 = v22.inputBackgroundColor, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, v27)
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v22.borderRadius)
            }), 
            SearchIcon = v4.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v16.search, 
                ImageColor3 = v22.textIconColor, 
                ImageTransparency = v22.textIconTransparency, 
                Position = UDim2.new(0, v22.iconOffsetX, 0.5, 0), 
                Size = UDim2.fromOffset(v22.iconSize, v22.iconSize)
            }), 
            SearchBox = v4.createElement("TextBox", {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClearTextOnFocus = false, 
                ClipsDescendants = true, 
                Font = v22.font, 
                OverlayNativeInput = true, 
                PlaceholderColor3 = v22.placeholderColor, 
                PlaceholderText = v28, 
                Position = UDim2.new(0, v29, 0.5, 0), 
                ReturnKeyType = Enum.ReturnKeyType.Search, 
                Size = UDim2.new(1, v30, 1, 0), 
                Text = v20.text or "", 
                TextColor3 = v22.textIconColor, 
                TextInputType = Enum.TextInputType.NoSuggestions, 
                TextSize = v22.textSize, 
                TextTransparency = v22.textIconTransparency, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [v4.Change.Text] = function(v32)
                    if v20.onChange then
                        v20.onChange(v32.Text or "");
                    end;
                    v25(v32.Text ~= "");
                end, 
                [v4.Event.FocusLost] = function(v33, v34, v35)
                    if (not (v35 == nil) or not v12 and not v23) or l_IsVRAppBuild_0() then
                        if not (not v34 or not v20.onSubmit) then
                            v20.onSubmit(v33.Text or "");
                        end;
                    elseif v20.onCancel then
                        v20.onCancel();
                        return ;
                    end;
                end, 
                [v4.Event.ReturnPressedFromOnScreenKeyboard] = function(v36)
                    if v20.onSubmit then
                        v20.onSubmit(v36.Text or "");
                    end;
                end, 
                [v4.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_TextBox", 
                ref = v26
            }), 
            ClearSearchButton = v24 and v4.createElement(l_ImageSetButton_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v16.clear, 
                ImageColor3 = v22.textIconColor, 
                ImageTransparency = v22.textIconTransparency, 
                Position = UDim2.new(1, v31, 0.5, 0), 
                Size = UDim2.fromOffset(v22.iconSize, v22.iconSize), 
                [v4.Event.Activated] = function()
                    if v26.current then
                        v26.current.Text = "";
                        if not v26.current:IsFocused() then
                            v26.current:CaptureFocus();
                        end;
                    end;
                end, 
                [v4.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_ClearButton"
            })
        }), 
        rigidSlot = if not v20.showCancelButton then nil else v4.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v22.font, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, 0, 0, v27), 
            Text = v21.cancelButtonText, 
            TextColor3 = v22.textIconColor, 
            TextSize = v22.textSize, 
            TextTransparency = v22.textIconTransparency, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            [v4.Event.Activated] = v20.onCancel, 
            [v4.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_CancelButton"
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v22.cancelButtonPadding), 
                PaddingLeft = UDim.new(0, v22.cancelButtonPadding)
            })
        })
    });
end;
