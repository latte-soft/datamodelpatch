local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_DarkTheme_0 = require(l_CorePackages_0.Workspace.Packages.Style).Themes.DarkTheme;
local v8 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_getIconSize_0 = v8.App.ImageSet.getIconSize;
local l_IconSize_0 = v8.App.ImageSet.Enum.IconSize;
local v12 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInGameMenuControls);
local v13 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInGameMenuModernization);
local v14 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInGameMenuModernizationBigText);
local v15 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInGameMenuModernizationStickyBar);
local v16 = require(script.Parent.Flags.GetFFlagAddAnimatedFocusState);
local v17 = require(l_RobloxGui_0.Modules.ExperienceMenuABTestManager);
local v18 = require(script.Parent.Parent.Chrome.Enabled);
local l_GetUIBloxEnableFontNameMapping_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local v20 = game:DefineFastFlag("IncreasePlayerNameSizeConsole", false);
local v21 = (v12() or v13()) or v18();
local v22 = v14();
local v23 = v15();
local v24 = not l_GetUIBloxEnableFontNameMapping_0() and 0.833 or 0.794;
local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
local v27 = {
    [Enum.FontSize.Size14] = Enum.FontSize.Size11, 
    [Enum.FontSize.Size18] = Enum.FontSize.Size14, 
    [Enum.FontSize.Size24] = Enum.FontSize.Size18, 
    [Enum.FontSize.Size36] = Enum.FontSize.Size28, 
    [Enum.FontSize.Size48] = Enum.FontSize.Size36
};
local v28 = Color3.fromRGB(0, 0, 0);
local v29 = l_AppFonts_0.default:getDefault();
local v30 = v27[Enum.FontSize.Size24];
local v31 = not l_GetUIBloxEnableFontNameMapping_0() and 20 or 19;
local v32 = {
    MenuContainer = {
        Color = Color3.new(0, 0, 0), 
        Transparency = 0.2
    }, 
    IGM_TabSelection = {
        Color = Color3.new(1, 1, 1), 
        Transparency = 0
    }, 
    White = {
        Color = Color3.new(1, 1, 1), 
        Transparency = 0
    }, 
    IGM_Background = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    IGM_Button = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    IGM_ButtonNonInteractable = {
        Color = Color3.fromRGB(100, 100, 100), 
        Transparency = 0
    }, 
    IGM_ButtonHover = {
        Color = Color3.fromRGB(56, 57, 59), 
        Transparency = 0
    }, 
    IGM_Stroke = {
        Color = Color3.new(0.776, 0.776, 0.776), 
        Transparency = 0
    }, 
    IGM_Selected = {
        Color = Color3.fromRGB(217, 217, 217), 
        Transparency = 0
    }, 
    Player_RowSelection = {
        Color = Color3.new(0.396, 0.4, 0.408), 
        Transparency = 0.9
    }
};
local v33 = {
    Confirmation_Font = {
        Font = l_AppFonts_0.default:getBold(), 
        RelativeSize = v27[Enum.FontSize.Size36], 
        TextSize = 36 * v24
    }, 
    Button_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        RelativeSize = v27[Enum.FontSize.Size24], 
        TextSize = not l_GetUIBloxEnableFontNameMapping_0() and 18 or 22 * v24
    }, 
    Username = {
        RelativeSize = if v22 or v20 and v5 then v27[Enum.FontSize.Size24] else v27[Enum.FontSize.Size18]
    }, 
    DisplayName = {
        RelativeSize = if not not v20 and v5 then Enum.FontSize.Size24 else Enum.FontSize.Size18, 
        Font = l_AppFonts_0.default:getMedium()
    }, 
    Settings_Font = {
        Font = l_AppFonts_0.default:getDefault()
    }, 
    Help_Title_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        RelativeSize = v27[Enum.FontSize.Size18]
    }, 
    Help_Text_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        RelativeSize = v27[Enum.FontSize.Size18], 
        TextSize = 18 * v24
    }, 
    Help_Gamepad_Font = {
        Font = l_AppFonts_0.default:getMedium()
    }, 
    Help_Touch_Font = {
        Font = l_AppFonts_0.default:getBold(), 
        RelativeSize = v27[Enum.FontSize.Size14]
    }, 
    Game_Settings_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        RelativeSize = v27[Enum.FontSize.Size24]
    }, 
    Conversation_Details_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 16 * v24
    }, 
    Utility_Text_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = not l_GetUIBloxEnableFontNameMapping_0() and 18 or 22 * v24
    }, 
    Utility_Text_Small_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 16 * v24
    }, 
    Utility_Row_Small_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 16 * v24
    }, 
    Utility_Row_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        TextSize = 16 * v24
    }, 
    Back_Button_Font = {
        Font = l_AppFonts_0.default:getSemibold(), 
        TextSize = 24 * v24
    }, 
    Semibold_Font = {
        Font = l_AppFonts_0.default:getSemibold()
    }, 
    Bold_Font = {
        Font = l_AppFonts_0.default:getMedium()
    }
};
setmetatable(v32, {
    __index = function(_, v35)
        return l_DarkTheme_0[v35];
    end
});
local v36 = {
    SETTINGS_SHIELD = "IGM_Background", 
    SETTINGS_SHIELD_TRANSPARENCY = "IGM_Background", 
    SELECTION_TEXT_COLOR_NORMAL = "White", 
    SELECTION_TEXT_COLOR_HIGHLIGHTED = "White", 
    HubBarContainer = "IGM_Background", 
    HubBarContainerTransparency = "IGM_Background", 
    HubBarContainerHover = "IGM_Background", 
    HubBarHomeButton = "IGM_Background", 
    HubBarHomeButtonHover = "IGM_Background", 
    HubBarHomeButtonTransparency = "IGM_Background", 
    HubBarHomeButtonTransparencyHover = "IGM_Background", 
    DarkenBackground = "Overlay", 
    PlayerRowFrame = "BackgroundDefault", 
    PlayerRowSelection = "Player_RowSelection", 
    TabSelection = "IGM_TabSelection", 
    DefaultButton = "IGM_Button", 
    DefaultButtonHover = "IGM_ButtonHover", 
    DefaultButtonStroke = "SecondaryDefault", 
    WhiteButtonText = "SecondaryContent", 
    MenuContainer = "BackgroundUIContrast", 
    ControlInputText = "SystemPrimaryDefault", 
    ControlInputStroke = "Divider", 
    ControlInputBackground = "BackgroundDefault", 
    ControlInputFocusedStroke = "IGM_TabSelection", 
    InputActionBackground = "BackgroundUIDefault", 
    IconButton = "UIDefault", 
    IconButtonHover = "BackgroundOnHover", 
    ImageButton = "Divider", 
    RowFrameBackground = "BackgroundDefault", 
    DropdownListBg = "BackgroundUIDefault", 
    DropdownListFocusBg = "UIDefault", 
    SELECTED_COLOR = "IGM_Selected", 
    NON_SELECTED_COLOR = "BackgroundUIDefault", 
    NotInteractableSelection = "UIEmphasis", 
    Confirmation = "Confirmation_Font", 
    Button = "Button_Font", 
    SettingsHub = "Settings_Font", 
    HelpTitle = "Help_Title_Font", 
    HelpText = "Help_Text_Font", 
    HelpGamepad = "Help_Gamepad_Font", 
    HelpTouch = "Help_Touch_Font", 
    GameSettings = "Game_Settings_Font", 
    ConversationDetails = "Conversation_Details_Font", 
    UtilityText = "Utility_Text_Font", 
    UtilityRow = "Utility_Row_Font", 
    UtilityRowSmall = "Utility_Row_Small_Font", 
    UtilityTextSmall = "Utility_Text_Small_Font", 
    BackButton = "Back_Button_Font", 
    Semibold = "Semibold_Font", 
    Bold = "Bold_Font", 
    ShareLinkTitle = "Utility_Text_Font", 
    ButtonNonInteractable = "IGM_ButtonNonInteractable"
};
local function v37()
    if not _G.__TESTEZ_RUNNING_TEST__ then
        if workspace.CurrentCamera then
            if not (workspace.CurrentCamera.ViewportSize ~= Vector2.new(0, 0)) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) then
                return nil;
            else
                return workspace.CurrentCamera.ViewportSize;
            end;
        else
            return nil;
        end;
    else
        return Vector2.new(1024, 1024);
    end;
end;
local function _()
    local v38 = v37();
    return v38 and v38.X < v38.Y;
end;
local v40 = v37();
local l_v40_0 = v40;
if l_v40_0 then
    l_v40_0 = l_UserInputService_0.TouchEnabled;
    if l_v40_0 then
        l_v40_0 = true;
        if v40.Y >= 500 then
            l_v40_0 = v40.X < 700;
        end;
    end;
end;
local function v44()
    local v42 = v37();
    local l_v42_0 = v42;
    if l_v42_0 then
        l_v42_0 = true;
        if v42.Y >= 500 then
            l_v42_0 = v42.X < 700;
        end;
    end;
    return v23 and l_v42_0;
end;
local v45 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 20), 
    PaddingRight = UDim.new(0, 20), 
    PaddingBottom = UDim.new(0, 14)
};
local v46 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 12), 
    PaddingRight = UDim.new(0, 12), 
    PaddingBottom = UDim.new(0, 12)
};
local v47 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 0), 
    Size = UDim2.new(0.95, 0, 0.95, 0), 
    AutomaticSize = Enum.AutomaticSize.None
};
local v48 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 0), 
    Size = UDim2.new(1, 0, 0.99, 0), 
    AutomaticSize = Enum.AutomaticSize.None
};
local v49 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 10), 
    Size = UDim2.new(0, 0, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
local v50 = {
    AnchorPoint = Vector2.new(0.5, 1), 
    Position = UDim2.new(0.5, 0, 1, 8), 
    Size = UDim2.new(0, 0, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
local v51 = {
    AnchorPoint = Vector2.new(0.5, 0), 
    Position = UDim2.new(0.5, 0, 0, l_l_GuiService_0_GuiInset_0.Y), 
    Size = UDim2.new(1, -24, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.Y
};
if not v21 then
    return {
        DefaultScrollBarThickness = 12, 
        DefaultCornerRadius = UDim.new(0, 8), 
        MenuContainerCornerRadius = UDim.new(0, 10), 
        AlwaysShowBottomBar = function()
            return false;
        end, 
        UseIconButtons = false, 
        UIBloxThemeEnabled = false, 
        EnableVerticalBottomBar = false, 
        DefaultStokeThickness = 1, 
        ShowHomeButton = true, 
        UseBiggerText = false, 
        UseStickyBar = function()
            return false;
        end, 
        EnableDarkenBackground = false, 
        TabHeaderIconPadding = 0, 
        UseInspectAndBuyPanel = function()
            return false;
        end, 
        HubPadding = function()
            if not l_v40_0 then
                return v45;
            else
                return v46;
            end;
        end, 
        MenuContainerPosition = function()
            if not l_v40_0 then
                return v47;
            else
                return v48;
            end;
        end, 
        ButtonHeight = 46, 
        LargeButtonHeight = 70, 
        SelectorArrowButtonWidth = 50, 
        VerticalMenuWidth = 92, 
        Images = l_Images_0, 
        getIconSize = l_getIconSize_0, 
        IconSize = l_IconSize_0, 
        SHIELD_INACTIVE_POSITION = UDim2.new(0, 0, -1, -36), 
        viewportResized = function()
        end, 
        color = function(_, v53)
            return v53 or v28;
        end, 
        transparency = function(_, v55)
            return v55 or 0;
        end, 
        font = function(v56, _)
            return v56;
        end, 
        fontSize = function(v58, _)
            return v58;
        end, 
        textSize = function(v60, _)
            return v60;
        end, 
        hydrateLabel = function(_, _, _)
        end, 
        platformNameTextSize = 18, 
        platformNameIconSize = UDim2.fromOffset(36, 36), 
        selectionCursor = nil
    };
else
    return {
        DefaultScrollBarThickness = 1, 
        DefaultCornerRadius = UDim.new(0, 8), 
        MenuContainerCornerRadius = UDim.new(0, 10), 
        DefaultStokeThickness = 1, 
        AlwaysShowBottomBar = function()
            local v65 = v37();
            local l_v65_0 = v65;
            if l_v65_0 then
                l_v65_0 = true;
                if v65.Y >= 500 then
                    l_v65_0 = v65.X < 700;
                end;
            end;
            if not (v23 and l_v65_0) then
                if not l_v40_0 then
                    return true;
                else
                    return false;
                end;
            else
                return true;
            end;
        end, 
        UIBloxThemeEnabled = true, 
        UseIconButtons = false, 
        ShowHomeButton = v17.default:shouldShowHomeButton(), 
        EnableVerticalBottomBar = false, 
        UseBiggerText = v22, 
        UseStickyBar = v44, 
        EnableDarkenBackground = true, 
        TabHeaderIconPadding = 5, 
        UseInspectAndBuyPanel = function()
            return l_v40_0;
        end, 
        HubPadding = function()
            if not l_v40_0 then
                return v45;
            else
                return v46;
            end;
        end, 
        MenuContainerPosition = function()
            if not l_v40_0 then
                return v49;
            else
                local v67 = v37();
                local l_v67_0 = v67;
                if l_v67_0 then
                    l_v67_0 = true;
                    if v67.Y >= 500 then
                        l_v67_0 = v67.X < 700;
                    end;
                end;
                if not (v23 and l_v67_0) then
                    return v50;
                else
                    return v51;
                end;
            end;
        end, 
        ButtonHeight = 36, 
        LargeButtonHeight = 48, 
        SelectorArrowButtonWidth = 32, 
        VerticalMenuWidth = 92, 
        Images = l_Images_0, 
        getIconSize = l_getIconSize_0, 
        IconSize = l_IconSize_0, 
        SHIELD_INACTIVE_POSITION = UDim2.new(0, 0, 1, 36), 
        viewportResized = function()
            v40 = v37();
            local l_v40_1 = v40;
            if l_v40_1 then
                l_v40_1 = l_UserInputService_0.TouchEnabled;
                if l_v40_1 then
                    l_v40_1 = true;
                    if v40.Y >= 500 then
                        l_v40_1 = v40.X < 700;
                    end;
                end;
            end;
            l_v40_0 = l_v40_1;
        end, 
        color = function(v70, v71)
            v70 = v36[v70] or v70;
            if not v32[v70] then
                return v71 or v28;
            else
                return v32[v70].Color;
            end;
        end, 
        transparency = function(v72, v73)
            v72 = v36[v72] or v72;
            if not v32[v72] then
                return v73 or 0;
            else
                return v32[v72].Transparency;
            end;
        end, 
        font = function(v74, v75)
            if v75 then
                v75 = v36[v75] or v75;
                if not v33[v75] then
                    return v74 or v29;
                else
                    return v33[v75].Font;
                end;
            else
                return v29;
            end;
        end, 
        fontSize = function(v76, v77)
            if v77 then
                v77 = v36[v77] or v77;
                if not v33[v77] then
                    return v76 or v30;
                else
                    return v33[v77].RelativeSize;
                end;
            else
                return v27[v76];
            end;
        end, 
        textSize = function(v78, v79)
            if v79 then
                if l_v40_0 and v79 == "UtilityRow" then
                    v79 = "UtilityRowSmall";
                elseif l_v40_0 and v79 == "UtilityText" then
                    v79 = "UtilityTextSmall";
                end;
                v79 = v36[v79] or v79;
                if not v33[v79] or not v33[v79].TextSize then
                    return v78 * v24 or v31;
                else
                    return v33[v79].TextSize;
                end;
            else
                return v78 * v24 or v31;
            end;
        end, 
        hydrateLabel = function(v80, v81, v82)
            v81 = v36[v81] or v81;
            if v32[v81] then
                local v83 = v32[v81];
                v80.TextColor3 = v83.Color;
                v80.TextTransparency = v83.Transparency;
            end;
            if v33[v82] then
                local v84 = v33[v81];
                v80.Font = v84.RelativeSize * 19.2;
                v80.TextSize = v84.TextSize;
            end;
        end, 
        platformNameTextSize = 18, 
        platformNameIconSize = UDim2.fromOffset(36, 36), 
        selectionCursor = if not v16() then nil else v32.SelectionCursor
    };
end;
