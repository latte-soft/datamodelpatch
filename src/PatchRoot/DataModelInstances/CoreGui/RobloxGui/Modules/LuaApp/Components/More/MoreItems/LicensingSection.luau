local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_DropdownMenu_0 = v4.App.Menu.DropdownMenu;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v8 = require(l_Modules_0.LuaApp.Components.More.Licensing.useLicenseData);
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_ScrollBarType_0 = v4.App.Container.Enum.ScrollBarType;
local l_VerticalScrollView_0 = v4.App.Container.VerticalScrollView;
local v12 = require(l_Modules_0.LuaApp.Components.FocusFrame);
local v13 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local l_BodyText_0 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText;
local _ = require(script.Parent.Types);
local function v25()
    local v16 = v8();
    local l_licenseList_0 = v16.licenseList;
    local l_initialLicenseKey_0 = v16.initialLicenseKey;
    local v19, v20 = v3.useState(nil);
    return v3.useMemo(function()
        return v2.map(l_licenseList_0, function(v21)
            return {
                text = v21.key
            };
        end);
    end, {
        l_licenseList_0
    }), v3.useMemo(function()
        local v23 = v2.map(l_licenseList_0, function(v22)
            return {
                key = v22.key, 
                value = table.concat(v22.value, "\n")
            };
        end);
        return ((v2.find(v23, function(v24)
            return v24.key == (v19 or l_initialLicenseKey_0);
        end) or v23[1]) or {
            key = "", 
            value = ""
        }).value;
    end, {
        v19, 
        l_licenseList_0, 
        l_initialLicenseKey_0
    }), v20;
end;
local function v32(v26)
    local v27 = l_useDesignTokens_0();
    local v28 = v3.useRef(nil);
    local v29 = v3.useRef(nil);
    v3.useEffect(function()
        if v28.current then
            for _, v31 in v28.current:GetDescendants() do
                if v31:IsA("GuiObject") then
                    if not (v31 == v29.current) or not v26.selectable then
                        v31.Selectable = false;
                    else
                        v31.Selectable = true;
                    end;
                end;
            end;
        end;
    end);
    return v3.createElement("Frame", {
        ref = v28, 
        Position = UDim2.new(), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v27.Semantic.Color.Background.Default.Color3, 
        BackgroundTransparency = not v26.selectable and 1 or v27.Semantic.Color.Background.Default.Transparency, 
        SelectionGroup = true, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop
    }, v3.createElement(l_VerticalScrollView_0, {
        ref = v29, 
        canvasSizeY = UDim.new(), 
        useAutomaticCanvasSize = true, 
        isGamepadFocusable = true, 
        scrollingEnabled = v26.scrollingEnabled, 
        scrollBarType = if not v26.scrollingEnabled then nil else l_ScrollBarType_0.Gamepad
    }, v26.children));
end;
local function v36(v33, v34, v35)
    return v3.createElement(v32, {
        scrollingEnabled = v33, 
        selectable = v34
    }, v35);
end;
return function(v37)
    local v38 = l_useLocalization_0({
        title = v37.titleKey, 
        noLicenses = "CommonUI.Messages.Message.NoLicenses"
    });
    local v39 = l_useDesignTokens_0();
    local l_LicensePanelWidthScale_0 = v39.LuaApps.More.LicensePanelWidthScale;
    local v41, v42 = v3.useState(0);
    local v43 = UDim.new(0, v39.Global.Space_300);
    local l_Color3_0 = v39.Semantic.Color.Common.Overlay.Color3;
    local l_Transparency_0 = v39.Semantic.Color.Common.Overlay.Transparency;
    local l_Default_0 = v39.Semantic.Color.Background.Default;
    local l_Font_0 = v39.Semantic.Typography.Body.Font;
    local l_FontSize_0 = v39.Semantic.Typography.Body.FontSize;
    local l_Size_300_0 = v39.Global.Size_300;
    local v50, v51, v52 = v25();
    local v54 = v3.useCallback(function(v53)
        if v53 then
            v42(v53.AbsoluteSize.X * l_LicensePanelWidthScale_0);
        end;
    end, {});
    local v55 = v3.useMemo(function()
        if not v51 then
            return 0;
        else
            return l_GetTextSize_0(v51, l_FontSize_0, l_Font_0, Vector2.new(v41 + l_Size_300_0 * 2, math.huge)).Y;
        end;
    end, {
        v51, 
        l_FontSize_0, 
        l_Font_0, 
        v41, 
        l_Size_300_0
    });
    return v3.createElement(v13, {
        layoutOrder = v37.layoutOrder, 
        withDivider = v37.withDivider, 
        title = v38.title
    }, v3.createElement("Frame", {
        Name = "LicenseDropdown", 
        ref = v54, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        BackgroundTransparency = 1, 
        ZIndex = 2
    }, v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v3.createElement(l_DropdownMenu_0, {
        placeholder = if #v50 > 0 then v50[1].text else v38.noLicenses, 
        onChange = v52, 
        height = UDim.new(0, 72), 
        screenSize = Vector2.new(1920, 1080), 
        cellDatas = v50, 
        menuListBackground = {
            Color = l_Default_0.Color3, 
            Transparency = l_Default_0.Transparency
        }
    }))), v3.createElement(v12, {
        layoutOrder = 2, 
        safeAreaSize = UDim2.new(1, -2 * v39.Global.Size_800, 0, 3 * v39.Global.Size_1000), 
        limitInlineHeight = true, 
        overlayColor3 = l_Color3_0, 
        overlayTransparency = l_Transparency_0, 
        renderContents = v3.useCallback(function()
            return v3.createElement("Frame", {
                Position = UDim2.new(), 
                Size = UDim2.fromScale(l_LicensePanelWidthScale_0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, v3.createElement("UIPadding", {
                PaddingTop = v43, 
                PaddingBottom = v43
            }), v3.createElement(l_BodyText_0, {
                text = v51, 
                layoutOrder = 2, 
                size = UDim2.new(1, 0, 1, v55), 
                TextYAlignment = Enum.TextYAlignment.Top
            }));
        end, {
            v51, 
            v55, 
            v43, 
            l_LicensePanelWidthScale_0
        }), 
        renderContentWrapper = v36
    }));
end;
