local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.AppCommonLib);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.SocialCommon);
local v5 = require(l_Parent_1.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Text_0 = v2.Text;
local l_useIsHovered_0 = v4.Hooks.useIsHovered;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v13 = require(l_Parent_0.Context.ShotsContext);
local v14 = require(l_Parent_0.Flags.FFlagCapturesRemoveOldMenuTheme);
local v15 = Color3.fromHex("#4F545F");
local v16 = Color3.fromHex("#5CB2F8");
local v17 = Color3.fromRGB(255, 255, 255);
local v18 = {
    IMAGE = l_Images_0["component_assets/dropshadow_17_4"], 
    SLICE_CENTER = Rect.new(12, 12, 13, 13), 
    OFFSET = {
        BOTTOM = 6, 
        LEFT = 4, 
        RIGHT = 4, 
        TOP = 2
    }
};
return function(v19)
    local v20 = l_useStyle_0();
    local l_themeOverrides_0 = v3.useContext(v13).themeOverrides;
    local v22, v23, v24 = l_useIsHovered_0();
    local l_Color_0 = v20.Theme.SystemPrimaryDefault.Color;
    local l_Transparency_0 = v20.Theme.SystemPrimaryDefault.Transparency;
    if v22 then
        l_Color_0 = v20.Theme.SystemPrimaryOnHover.Color;
        l_Transparency_0 = v20.Theme.SystemPrimaryOnHover.Transparency;
    end;
    local l_Color_1 = v20.Theme.TextEmphasis.Color;
    local l_Font_0 = v20.Font.Header2.Font;
    local v29 = v20.Font.BaseSize * v20.Font.Header2.RelativeSize;
    if not (v14 or not l_themeOverrides_0) then
        l_Color_0 = l_themeOverrides_0.color("DefaultButton", v15);
        l_Transparency_0 = l_themeOverrides_0.transparency("DefaultButton", 0);
        if v22 then
            l_Color_0 = l_themeOverrides_0.color("DefaultButtonHover", v16);
            l_Transparency_0 = l_themeOverrides_0.transparency("DefaultButtonHover", 0);
        end;
        l_Color_1 = l_themeOverrides_0.color("TextEmphasis", v17);
        l_Font_0 = l_themeOverrides_0.font(l_Font_0, "UtilityText");
        v29 = l_themeOverrides_0.textSize(24, "UtilityText");
    end;
    local v30 = v3.useMemo(function()
        if not v19.buttonWidth then
            return l_Text_0.GetTextWidth(v19.text, l_Font_0, v29) + 24;
        else
            return v19.buttonWidth;
        end;
    end, {
        v19.text, 
        l_Font_0, 
        v29, 
        v19.buttonWidth
    });
    return v3.createElement("Frame", {
        AnchorPoint = v19.AnchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.LayoutOrder, 
        Position = v19.Position, 
        Size = if not v19.buttonHeight then UDim2.new(0, v30, 1, 0) else UDim2.fromOffset(v30, v19.buttonHeight)
    }, {
        DropShadow = if v14 then nil else v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v18.IMAGE, 
            ImageColor3 = v20.Theme.DropShadow.Color, 
            ImageTransparency = v20.Theme.DropShadow.Transparency, 
            Position = UDim2.new(0, -v18.OFFSET.LEFT, 0, -v18.OFFSET.TOP), 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, v18.OFFSET.LEFT + v18.OFFSET.RIGHT, 1, v18.OFFSET.TOP + v18.OFFSET.BOTTOM), 
            SliceCenter = v18.SLICE_CENTER, 
            ZIndex = 1
        }), 
        ShowMoreButton = if v14 then v3.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            onActivated = v19.onActivated, 
            size = UDim2.fromScale(1, 1), 
            text = v19.text
        }) else v3.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            Font = l_Font_0, 
            Size = UDim2.fromScale(1, 1), 
            Text = v19.text, 
            TextColor3 = l_Color_1, 
            TextSize = v29, 
            ZIndex = 2, 
            [v3.Event.Activated] = v19.onActivated, 
            [v3.Event.InputBegan] = v23, 
            [v3.Event.InputEnded] = v24
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            })
        })
    });
end;
