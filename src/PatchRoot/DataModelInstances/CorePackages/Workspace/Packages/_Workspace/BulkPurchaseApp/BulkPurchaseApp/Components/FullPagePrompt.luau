local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v6 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useCursor_0 = v6.App.SelectionCursor.useCursor;
local v11 = require(l_script_FirstAncestor_0.Hooks.useScreenSize);
local v12 = require(l_script_FirstAncestor_0.constants);
local v13 = require(script.Parent.Scrim);
local v14 = require(script.Parent.Box);
local function v17(v15)
    local v16 = l_useDesignTokens_0();
    return v2.createElement("TextButton", {
        Size = UDim2.fromOffset(v16.Global.Size_450, v16.Global.Size_450), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Event.Activated] = v15.onActivated, 
        Text = "", 
        [v2.Tag] = "data-testid=BulkPurchaseApp_FullPagePromptCloseButton", 
        SelectionImageObject = l_useCursor_0(UDim.new(0, v16.Semantic.Radius.Medium), 0)
    }, v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromOffset(v16.Global.Size_350, v16.Global.Size_350), 
        BackgroundTransparency = 1, 
        Image = l_Images_0["icons/navigation/close"], 
        ImageColor3 = v16.Semantic.Color.Text.Emphasis.Color3, 
        ImageTransparency = v16.Semantic.Color.Text.Emphasis.Transparency, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    }));
end;
local function v19(v18)
    return {
        background = v18.Semantic.Color.Background.Default.Color3, 
        padding = v18.Global.Space_300, 
        cornerRadius = v18.Semantic.Radius.Medium, 
        headerFontStyle = v18.Semantic.Typography.Header, 
        headerColorStyle = v18.Semantic.Color.Text.Emphasis, 
        headerMarginBottom = v18.Global.Space_400, 
        headerHeight = v18.Global.Size_350
    };
end;
return (v2.forwardRef(function(v20, v21)
    local v22 = v11();
    local v23 = l_useDesignTokens_0(v19);
    local v24 = l_useUiModeInfo_0();
    local v25 = if v24.uiMode == l_UiMode_0.TenFoot then v12.MAX_WIDTH * v12.TEN_FOOT_MULTIPLIER else v12.MAX_WIDTH;
    local v26 = if v24.uiMode == l_UiMode_0.TenFoot then v12.MAX_HEIGHT * v12.TEN_FOOT_MULTIPLIER else v12.MAX_HEIGHT;
    local v27 = false;
    if v22.X < v12.MOBILE_BREAKPOINT then
        v27 = v22.X < v22.Y;
    end;
    return v2.createElement(v13, {
        ref = v21
    }, v2.createElement(v14, {
        padding = {
            v23.padding, 
            v23.padding, 
            v23.padding, 
            v23.padding
        }, 
        cornerRadius = UDim.new(0, v23.cornerRadius), 
        Size = UDim2.new(not v27 and 0 or 1, if not v27 then math.min(v25, v22.X) else 0, 0, (math.min(v26, v22.Y))), 
        BackgroundColor3 = v23.background, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0.5, not v27 and 0.5 or 1), 
        AnchorPoint = Vector2.new(0.5, not v27 and 0.5 or 1)
    }, {
        Header = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v23.headerHeight)
        }, v2.createElement(l_StyledTextLabel_0, {
            fontStyle = v23.headerFontStyle, 
            colorStyle = v23.headerColorStyle, 
            textXAlignment = Enum.TextXAlignment.Center, 
            textYAlignment = Enum.TextYAlignment.Center, 
            text = v20.title, 
            size = UDim2.new(1, 0, 1, 0)
        }), v2.createElement(v17, {
            onActivated = v20.onClose
        })), 
        Content = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, -v23.headerHeight - v23.headerMarginBottom), 
            Position = UDim2.fromOffset(0, v23.headerHeight + v23.headerMarginBottom)
        }, v20.children)
    }));
end));
