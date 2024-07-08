local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.AppCommonLib);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.UIBlox);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Text_0 = v2.Text;
local v9 = require(l_Parent_0.Experimentation.getIsFeatureVisibleToDesktopUser);
local v10 = require(l_Parent_0.Components.OnOffButton);
local v11 = require(l_Parent_0.App.ScreenshotsPolicy);
local v12 = require(l_Parent_0.Context.ShotsContext);
local v13 = require(l_Parent_0.Components.VideoCaptureCTA);
local v14 = require(l_Parent_0.Flags.FFlagCapturesRemoveOldMenuTheme);
local v15 = require(l_Parent_0.Flags.FFlagDecomposeDesktopCapturesEligibilityCheck);
local l_GetFFlagEnableScreenshotUtility_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableScreenshotUtility;
local v17 = UDim.new(0, 8);
local v18 = Color3.fromRGB(255, 255, 255);
local v19 = Color3.fromRGB(255, 255, 255);
local function v43(v20)
    local v21 = l_useStyle_0();
    local l_themeOverrides_0 = v4.useContext(v12).themeOverrides;
    local v23 = l_GetFFlagEnableScreenshotUtility_0() and v4.useContext(v12).chromeEnabled;
    local v24, v25 = v4.useState(Vector2.new(0, 0));
    local v26 = l_useLocalization_0({
        capturesTitle = "Feature.Captures.Title.Captures", 
        educationalText = "Feature.Captures.Label.EducationalText"
    });
    local v27 = v9() or v15;
    local l_Color_0 = v21.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v21.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v21.Theme.TextDefault.Color;
    local l_Font_0 = v21.Font.CaptionBody.Font;
    local v32 = v21.Font.BaseSize * v21.Font.CaptionBody.RelativeSize;
    local l_Color_2 = v21.Theme.TextEmphasis.Color;
    local l_Font_1 = v21.Font.Header2.Font;
    local v35 = v21.Font.BaseSize * v21.Font.Header2.RelativeSize;
    if not (v14 or not l_themeOverrides_0) then
        l_Color_0 = l_themeOverrides_0.color("RowFrameBackground", v18);
        l_Transparency_0 = l_themeOverrides_0.transparency("RowFrameBackground", 0.85);
        l_Color_1 = l_themeOverrides_0.color("TextDefault", v19);
        l_Font_0 = l_themeOverrides_0.font(l_Font_0, "UtilityText");
        v32 = l_themeOverrides_0.textSize(16, "UtilityText");
        l_Color_2 = l_themeOverrides_0.color("TextEmphasis", v19);
        l_Font_1 = l_themeOverrides_0.font(l_Font_1, "Button");
        v35 = l_themeOverrides_0.textSize(24, "Button");
    end;
    local v37 = v4.useCallback(function(v36)
        v25(v36.AbsoluteSize);
        if v20.onAbsoluteSizeChanged then
            v20.onAbsoluteSizeChanged(v36.AbsoluteSize);
        end;
    end, {});
    local v38 = v4.useMemo(function()
        return l_Text_0.GetTextWidth(v26.educationalText, l_Font_0, v32);
    end, {
        v26.educationalText, 
        l_Font_0, 
        v32
    });
    local l_X_0 = v24.X;
    local v40 = v38 < (l_X_0 - 224) - 24;
    local v41 = 20;
    if not (v40 or v38 < l_X_0 - 24) then
        v41 = l_Text_0.GetTextHeight(v26.educationalText, l_Font_0, v32, l_X_0 - 24) + 10;
    end;
    local v42 = {
        TextFrame = v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0)
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Title = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = v26.capturesTitle, 
                TextColor3 = l_Color_2, 
                TextSize = v35, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            EducationalLabel = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v41), 
                Text = v26.educationalText, 
                TextColor3 = l_Color_1, 
                TextSize = v32, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        CapturesToggleFrame = v4.createElement("Frame", {
            AnchorPoint = if not v40 then Vector2.new(1, 0) else Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Position = if not v40 then UDim2.new(1, 0, 0, -10) else UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(224, 44)
        }, {
            OnOffButton = v4.createElement(v10, {
                height = 44, 
                width = 224
            })
        })
    };
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v20.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        [v4.Change.AbsoluteSize] = v37
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = if not l_themeOverrides_0 then v17 else l_themeOverrides_0.DefaultCornerRadius
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12)
        }), 
        Layout = if not v27 or v23 then nil else v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        CapturesToggleCTA = if not v27 or v23 then nil else v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0)
        }, v42), 
        TextFrame = if v27 or v23 then nil else v42.TextFrame, 
        CapturesToggleFrame = if v27 or v23 then nil else v42.CapturesToggleFrame, 
        Space = if not (not not v27 and v20.eligibleForVideoCapture) or v23 then nil else v4.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 20), 
            LayoutOrder = 2
        }), 
        VideoCaptureCTA = if not not v27 and v20.eligibleForVideoCapture then v4.createElement(v13, {
            closeSettingsMenu = v20.closeSettingsMenu, 
            LayoutOrder = 3
        }) else nil
    });
end;
if not (not v15 and not v9()) then
    v43 = v11.connect(function(v44)
        return {
            eligibleForVideoCapture = v44.eligibleForVideoCapture()
        };
    end)(v43);
end;
return v43;
