local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.React);
local l_useExternalEvent_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Hooks.useExternalEvent;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage);
local v10 = nil;
v10 = if not v9() then require(l_CoreGui_0.RobloxGui.Modules.InGameMenu.Localization.Localization) else require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v11 = require(l_CoreGui_0.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog);
return function(v12)
    local v13 = l_useDesignTokens_0();
    local l_CaptionHeader_0 = v13.Semantic.Typography.CaptionHeader;
    local l_Space_200_0 = v13.Global.Space_200;
    local l_Space_75_0 = v13.Global.Space_75;
    local l_Medium_0 = v13.Semantic.Radius.Medium;
    local l_Size_300_0 = v13.Global.Size_300;
    local l_Contrast_0 = v13.Semantic.Color.BackgroundUi.Contrast;
    local l_Color3_0 = v13.Semantic.Color.Text.Emphasis.Color3;
    local l_Space_50_0 = v13.Global.Space_50;
    local v22 = if not not v11 and game:GetEngineFeature("GetImageForKeyCode") then l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png";
    local v23 = nil;
    local v24 = nil;
    if not v11 then
        local v25 = {
            VirtualCursorHintPreIcon = "Some experiences require pressing ", 
            VirtualCursorHintPostIcon = " to toggle menu navigation"
        };
        v23 = v25.VirtualCursorHintPreIcon;
        v24 = v25.VirtualCursorHintPostIcon;
    else
        local v26, v27 = v5.useState(l_LocalizationService_0.RobloxLocaleId);
        local l_v27_0 = v27 --[[ copy: 14 -> 17 ]];
        l_useExternalEvent_0(l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), function()
            l_v27_0(l_LocalizationService_0.RobloxLocaleId);
        end);
        local l_v26_0 = v26 --[[ copy: 13 -> 18 ]];
        local v36, v37 = v5.useMemo(function()
            local v30 = v10.new(l_v26_0);
            local l_status_0, l_result_0 = pcall(v30.Format, v30, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon");
            local l_status_1, l_result_1 = pcall(v30.Format, v30, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon");
            local v35 = not l_status_0 and "Some experiences require pressing" or l_result_0;
            if not l_status_1 then
                return v35, "to toggle menu navigation";
            else
                return v35, l_result_1;
            end;
        end, {
            v26
        });
        v23 = v36;
        v24 = v37;
    end;
    local v38, v39 = v5.useMemo(function()
        return l_GetTextSize_0(v23, l_CaptionHeader_0.FontSize, l_CaptionHeader_0.Font, Vector2.new(math.huge, math.huge)), (l_GetTextSize_0(v24, l_CaptionHeader_0.FontSize, l_CaptionHeader_0.Font, Vector2.new(math.huge, math.huge)));
    end, {
        l_CaptionHeader_0.FontSize, 
        l_CaptionHeader_0.Font, 
        v23, 
        v24
    });
    return v5.createElement("Frame", {
        BackgroundColor3 = l_Contrast_0.Color3, 
        BackgroundTransparency = l_Contrast_0.Transparency, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v12.Position
    }, {
        Corner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_Medium_0)
        }), 
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = if not v11 then nil else UDim.new(0, l_Space_50_0)
        }), 
        LeftText = v5.createElement("TextLabel", {
            Size = UDim2.fromOffset(v38.X, v38.Y), 
            Text = v23, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Color3_0, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.FontSize, 
            TextWrapped = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }), 
        Icon = v5.createElement("ImageLabel", {
            Size = UDim2.fromOffset(l_Size_300_0, l_Size_300_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 100, 
            Image = v22
        }), 
        RightText = v5.createElement("TextLabel", {
            Size = UDim2.fromOffset(v39.X, v39.Y), 
            Text = v24, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Color3_0, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.FontSize, 
            TextWrapped = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 200
        }), 
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_75_0), 
            PaddingBottom = UDim.new(0, l_Space_75_0), 
            PaddingLeft = UDim.new(0, l_Space_200_0), 
            PaddingRight = UDim.new(0, l_Space_200_0)
        })
    });
end;
