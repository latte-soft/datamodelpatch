local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnable10ftPrivacyLink);
local function v15(v12, v13, v14)
    if v12 == Enum.FillDirection.Horizontal then
        return {
            CellSize = UDim2.new(0.5, -v14, 0, v13)
        };
    else
        return {
            CellSize = UDim2.new(1, 0, 0, v13)
        };
    end;
end;
local function v22(v16)
    local v17 = l_useStyle_0();
    local v18 = l_useDesignTokens_0();
    local v19 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v20 = v18.Global.Size_700 or 80;
    local v21 = v18.Global.Size_350 or 42;
    return v2.createElement("ImageButton", {
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v20), 
        BackgroundTransparency = 1, 
        LayoutOrder = v16.layoutOrder, 
        [v2.Event.Activated] = v16.activated, 
        SelectionImageObject = v19
    }, {
        padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 36), 
            PaddingRight = UDim.new(0, 36)
        }), 
        ButtonText = v2.createElement(l_StyledTextLabel_0, {
            text = v16.text, 
            automaticSize = Enum.AutomaticSize.X, 
            size = UDim2.new(1, 0, 0, v20), 
            textXAlignment = Enum.TextXAlignment.Left, 
            fontStyle = v17.Font.Header1, 
            colorStyle = v17.Theme.TextDefault, 
            layoutOrder = 1
        }), 
        LinkIconImage = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v21, 0, v21), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ScaleType = Enum.ScaleType.Fit, 
            Image = l_Images_0["icons/navigation/externallink_medium"], 
            ImageColor3 = v17.Theme.UIEmphasis.Color, 
            ImageTransparency = 0
        })
    });
end;
return function(v23)
    local v24 = l_useDesignTokens_0();
    local v25 = v24.Global.Size_700 or 80;
    local v26 = v24.Global.Space_150 or 18;
    local v27 = v23.fillDirection or Enum.FillDirection.Vertical;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 0), 
        Selectable = false, 
        LayoutOrder = v23.layoutOrder
    }, {
        gridlayout = v2.createElement("UIGridLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = v27, 
            CellPadding = UDim2.new(0, v26, 0, v26), 
            CellSize = v15(v27, v25, v26).CellSize
        }), 
        ButtonTos = v2.createElement(v22, {
            text = v23.textTos, 
            activated = v23.activatedTos, 
            layoutOrder = 1
        }), 
        ButtonPrivacy = v2.createElement(v22, {
            text = v23.textPrivacy, 
            activated = if not v11() then v23.activatedTos else v23.activatedPrivacy, 
            layoutOrder = 2
        })
    });
end;
