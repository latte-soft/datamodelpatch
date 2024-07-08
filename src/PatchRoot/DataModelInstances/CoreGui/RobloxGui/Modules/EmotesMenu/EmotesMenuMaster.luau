local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = require(l_CorePackages_0.Roact);
local v10 = require(l_CorePackages_0.Rodux);
local v11 = require(l_CorePackages_0.RoactRodux);
local v12 = require(l_CorePackages_0.UIBlox);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Components_0 = l_Parent_0.Components;
local l_Reducers_0 = l_Parent_0.Reducers;
local l_Thunks_0 = l_Parent_0.Thunks;
local l_Utility_0 = l_Parent_0.Utility;
local v20 = require(l_Parent_1.BackpackScript);
local v21 = require(l_Parent_1.ChatSelector);
local v22 = require(l_Parent_1.TenFootInterface);
local v23 = require(l_Parent_1.TopBar.Constants);
local l_Constants_0 = v12.App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v26 = require(l_Utility_0.CanPlayEmotes);
local v27 = require(l_Parent_0.Constants);
local v28 = require(l_Components_0.EmotesMenu);
local v29 = require(l_Reducers_0.EmotesMenuReducer);
local v30 = require(l_Thunks_0.OpenMenu);
local v31 = require(l_Actions_0.HideMenu);
local v32 = require(l_Actions_0.EmotesChanged);
local v33 = require(l_Actions_0.EquippedEmotesChanged);
local v34 = require(l_Actions_0.NumberEmotesLoadedChanged);
local v35 = require(l_Actions_0.SetGuiInset);
local v36 = require(l_Actions_0.SetLayout);
local v37 = require(l_Actions_0.SetLocale);
local v38 = {};
v38.__index = v38;
local function _()
    return (l_RunService_0:IsClient() and not l_RunService_0:IsEdit()) and not l_RunService_0:IsRunMode();
end;
v38.isOpen = function(v40)
    return v40.store:getState().displayOptions.menuVisible;
end;
v38.isEmotesLoaded = function(v41)
    return v41.store:getState().emotesPage.numberEmotesLoaded > 0;
end;
v38.open = function(v42)
    v42.store:dispatch(v30());
end;
v38.close = function(v43)
    v43.store:dispatch(v31());
end;
v38.setTopBarEnabled = function(v44, v45)
    v44.topBarEnabled = v45;
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
    if (not v45 or not l_l_StarterGui_0_CoreGuiEnabled_0) or not v44.canPlayEmotes then
        v44:_unmount();
        return ;
    else
        v44:_mount();
        return ;
    end;
end;
v38._connectCoreGuiListeners = function(v47)
    v20.StateChanged.Event:Connect(function(v48)
        if v48 then
            if v47:isOpen() then
                v47:close();
            end;
            return ;
        else
            return ;
        end;
    end);
    v21.VisibilityStateChanged:connect(function(v49)
        if v49 then
            if v47:isOpen() then
                v47:close();
            end;
            return ;
        else
            return ;
        end;
    end);
end;
v38._connectApiListeners = function(v50)
    l_StarterGui_0.CoreGuiChangedSignal:connect(function(v51, v52)
        if v50.topBarEnabled then
            if v50.canPlayEmotes then
                if not (v51 ~= Enum.CoreGuiType.EmotesMenu) or v51 == Enum.CoreGuiType.All then
                    if not v52 then
                        v50:_unmount();
                    else
                        v50:_mount();
                        return ;
                    end;
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end);
    l_GuiService_0.EmotesMenuOpenChanged:Connect(function(v53)
        if not v53 then
            if v50:isOpen() then
                v50:close();
            end;
        elseif not v50:isOpen() then
            v50:open();
            return ;
        end;
    end);
end;
v38._onEquippedEmotesChanged = function(v54, v55)
    v54.store:dispatch(v33(v55));
end;
v38._onEmotesChanged = function(v56, v57)
    v56.store:dispatch(v32(v57));
end;
v38._onNumberEmotesLoadedChanged = function(v58, v59)
    v58.store:dispatch(v34(v59));
    v58.EmotesLoaded:Fire(v59 > 0);
end;
v38._onHumanoidDescriptionChanged = function(v60, v61)
    if v60.equippedEmotesChangedConn then
        v60.equippedEmotesChangedConn:Disconnect();
        v60.equippedEmotesChangedConn = nil;
    end;
    if v60.emotesChangedConn then
        v60.emotesChangedConn:Disconnect();
        v60.emotesChangedConn = nil;
    end;
    if v60.numberEmotesLoadedChangedConn then
        v60.numberEmotesLoadedChangedConn:Disconnect();
        v60.numberEmotesLoadedChangedConn = nil;
    end;
    if v60.humanoidDescriptionAncestryConn then
        v60.humanoidDescriptionAncestryConn:Disconnect();
        v60.humanoidDescriptionAncestryConn = nil;
    end;
    if not v61 then
        v60:_onEquippedEmotesChanged({});
        v60:_onEmotesChanged({});
        v60:_onNumberEmotesLoadedChanged(-1);
        return ;
    else
        v60.equippedEmotesChangedConn = v61.EquippedEmotesChanged:Connect(function(v62)
            v60:_onEquippedEmotesChanged(v62);
        end);
        v60:_onEquippedEmotesChanged(v61:GetEquippedEmotes());
        v60.emotesChangedConn = v61.EmotesChanged:Connect(function(v63)
            v60:_onEmotesChanged(v63);
        end);
        v60:_onEmotesChanged(v61:GetEmotes());
        v60.numberEmotesLoadedChangedConn = v61:GetPropertyChangedSignal("NumberEmotesLoaded"):Connect(function(v64)
            v60:_onNumberEmotesLoadedChanged(v64);
        end);
        v60:_onNumberEmotesLoadedChanged(v61.NumberEmotesLoaded);
        v60.humanoidDescriptionAncestryConn = v61.AncestryChanged:Connect(function(v65, v66)
            if v65 == v61 and v66 == nil then
                v60:_onHumanoidDescriptionChanged(nil);
            end;
        end);
        return ;
    end;
end;
v38._onHumanoidChanged = function(v67, v68)
    if v67.humanoidChildAddedConn then
        v67.humanoidChildAddedConn:Disconnect();
        v67.humanoidChildAddedConn = nil;
    end;
    if v67.humanoidAncestryChangedConn then
        v67.humanoidAncestryChangedConn:Disconnect();
        v67.humanoidAncestryChangedConn = nil;
    end;
    if not v68 then
        v67:_onHumanoidDescriptionChanged(nil);
        return ;
    else
        v67.humanoidChildAddedConn = v68.ChildAdded:Connect(function(v69)
            if v69:IsA("HumanoidDescription") then
                v67:_onHumanoidDescriptionChanged(v69);
            end;
        end);
        local l_HumanoidDescription_0 = v68:FindFirstChildOfClass("HumanoidDescription");
        if l_HumanoidDescription_0 then
            v67:_onHumanoidDescriptionChanged(l_HumanoidDescription_0);
        end;
        v67.humanoidAncestryChangedConn = v68.AncestryChanged:Connect(function(v71, v72)
            if v71 == v68 and v72 == nil then
                v67:_onHumanoidChanged(nil);
            end;
        end);
        return ;
    end;
end;
v38._onCharacterAdded = function(v73, v74)
    if v73.characterChildAddedConn then
        v73.characterChildAddedConn:Disconnect();
        v73.characterChildAddedConn = nil;
    end;
    v73.characterChildAddedConn = v74.ChildAdded:Connect(function(v75)
        if v75:IsA("Humanoid") then
            v73:_onHumanoidChanged(v75);
        end;
    end);
    local l_Humanoid_0 = v74:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 then
        v73:_onHumanoidChanged(l_Humanoid_0);
    end;
end;
v38._connectListeners = function(v77)
    v77:_connectCoreGuiListeners();
    v77:_connectApiListeners();
    l_LocalPlayer_0.CharacterAdded:Connect(function(v78)
        v77:_onCharacterAdded(v78);
    end);
    if l_LocalPlayer_0.Character then
        v77:_onCharacterAdded(l_LocalPlayer_0.Character);
    end;
    l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
        v77.store:dispatch(v37(l_LocalizationService_0.RobloxLocaleId));
    end);
    v26.ChangedEvent.Event:connect(function(v79)
        v77.canPlayEmotes = v79;
        local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
        if (not v79 or not v77.topBarEnabled) or not l_l_StarterGui_0_CoreGuiEnabled_1 then
            v77:_unmount();
            return ;
        else
            v77:_mount();
            return ;
        end;
    end);
end;
v38._onStateChanged = function(v81, v82, v83)
    if v83.displayOptions.menuVisible ~= v82.displayOptions.menuVisible then
        v81.EmotesMenuToggled:Fire(v82.displayOptions.menuVisible);
        l_GuiService_0:SetEmotesMenuOpen(v82.displayOptions.menuVisible);
    end;
end;
v38._mount = function(v84)
    local v85 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    if not v84.instance then
        v84.instance = v9.mount(v9.createElement(v11.StoreProvider, {
            store = v84.store
        }, {
            v9.createElement(l_UiModeStyleProvider_0, {
                style = v85
            }, {
                EmotesMenu = v9.createElement(v28)
            })
        }), l_RobloxGui_0, "EmotesMenu");
        v84.MenuIsVisible = true;
        v84.MenuVisibilityChanged:Fire(true);
    end;
end;
v38._unmount = function(v86)
    if v86.instance then
        v9.unmount(v86.instance);
        v86.instance = nil;
        v86.MenuIsVisible = false;
        v86.MenuVisibilityChanged:Fire(false);
    end;
end;
v38.new = function()
    local v87 = setmetatable({}, v38);
    v87.canPlayEmotes = v26.Value;
    v87.topBarEnabled = true;
    v87.EmotesMenuToggled = Instance.new("BindableEvent");
    v87.MenuIsVisible = false;
    v87.MenuVisibilityChanged = Instance.new("BindableEvent");
    v87.EmotesLoaded = Instance.new("BindableEvent");
    v87.store = v10.Store.new(v29, {}, {
        v10.thunkMiddleware
    });
    if (l_RunService_0:IsClient() and not l_RunService_0:IsEdit()) and not l_RunService_0:IsRunMode() then
        v87.store.changed:connect(function(v88, v89)
            v87:_onStateChanged(v88, v89);
        end);
        v87.store:dispatch(v37(l_LocalizationService_0.RobloxLocaleId));
        if v22:IsEnabled() then
            v87.store:dispatch(v36(v27.Layout.TenFoot));
        end;
        local l_TopBarHeight_0 = v23.TopBarHeight;
        if not l_RobloxGui_0.IgnoreGuiInset then
            v87.store:dispatch(v35(l_TopBarHeight_0));
        end;
        v87:_mount();
        v87:_connectListeners();
        return v87;
    else
        return v87;
    end;
end;
return v38.new();
