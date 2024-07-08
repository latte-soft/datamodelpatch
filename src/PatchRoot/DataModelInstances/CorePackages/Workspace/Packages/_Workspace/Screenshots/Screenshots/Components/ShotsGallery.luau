local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v9 = require(l_Parent_0.Components.GalleryGridView);
local v10 = require(l_Parent_0.Context.ShotsContext);
local v11 = require(l_Parent_0.Flags.FFlagCapturesRemoveOldMenuTheme);
local v12 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementEnabled);
local v13 = Color3.fromRGB(255, 255, 255);
local v14 = Color3.fromRGB(255, 255, 255);
return function(v15)
    local v16 = l_useStyle_0();
    local l_themeOverrides_0 = v3.useContext(v10).themeOverrides;
    local v19 = l_useSelector_0(function(v18)
        return v18.Screenshots.Captures;
    end);
    local v20 = next(v19) == nil;
    local v21 = l_useLocalization_0({
        nothingHereYet = "Feature.Captures.Label.NothingHereYet", 
        title = "Feature.Captures.Title.Gallery"
    });
    local v22 = v15.Size or UDim2.fromScale(1, 1);
    local l_Color_0 = v16.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v16.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v16.Theme.TextMuted.Color;
    local l_Font_0 = v16.Font.CaptionBody.Font;
    local v27 = v16.Font.BaseSize * v16.Font.CaptionBody.RelativeSize;
    local l_Transparency_1 = v16.Theme.TextMuted.Transparency;
    if not (v11 or not l_themeOverrides_0) then
        l_Color_0 = l_themeOverrides_0.color("RowFrameBackground", v13);
        l_Transparency_0 = l_themeOverrides_0.transparency("RowFrameBackground", 0.85);
        l_Color_1 = l_themeOverrides_0.color("TextDefault", v14);
        l_Font_0 = l_themeOverrides_0.font(l_Font_0, "HelpText");
        v27 = l_themeOverrides_0.textSize(20, "HelpText");
        l_Transparency_1 = l_themeOverrides_0.transparency("TextDefault", 0.3);
    end;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v15.LayoutOrder, 
        Size = v22
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = if not l_themeOverrides_0 then UDim.new(0, 8) else l_themeOverrides_0.DefaultCornerRadius
        }), 
        UIPadding = if v12 then nil else v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12)
        }), 
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        NothingHereYet = v20 and v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_0, 
            Size = UDim2.new(1, -12, 1, 12), 
            Text = v21.nothingHereYet, 
            TextColor3 = l_Color_1, 
            TextSize = v27, 
            TextTransparency = l_Transparency_1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center
        }, {
            MaxSize = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(312, math.huge)
            })
        }), 
        GalleryGridView = not v20 and v3.createElement(v9, {
            captures = v19, 
            Size = UDim2.new(1, -12, 1, -12)
        })
    });
end;
