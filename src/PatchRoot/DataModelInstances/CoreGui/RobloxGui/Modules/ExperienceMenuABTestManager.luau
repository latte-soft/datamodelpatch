local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = script.Parent.InGameMenu;
local v5 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v6 = require(script.Parent.IsExperienceMenuABTestEnabled);
local v7 = require(script.Parent.Flags.GetFStringLuaAppExperienceMenuLayer);
local v8 = require(script.Parent.Flags.GetFStringLuaAppConsoleExperienceMenuLayer);
local v9 = require(script.Parent.Flags.GetFFlagDisableChromeUnibar)();
local v10 = require(script.Parent.Flags.GetFFlagDisableChromePinnedChat)();
local v11 = require(script.Parent.Flags.GetFFlagDisableChromeDefaultOpen)();
local v12 = require(script.Parent.Flags.GetFFlagDisableChromeFollowupUnibar)();
local v13 = require(script.Parent.Flags.GetFFlagDisableChromeFollowupFTUX)();
local v14 = require(script.Parent.Flags.GetFFlagDisableChromeFollowupOcclusion)();
local l_GetFFlagEnableNewExperienceMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNewExperienceMenuLayer;
local v16 = game:DefineFastInt("CSATV3MenuActionThreshold", 7);
local v17 = "v1" .. "t9";
local v18 = "v2" .. "t9";
local v19 = "v3" .. "t9";
local v20 = "ARv2" .. "art2";
local v21 = {
    BASELINE = "v4.1" .. "t9", 
    OLD_LAYOUT = "v4.2" .. "t9", 
    HOME_BUTTON = "v4.3" .. "t9"
};
local v22 = {
    MODERNIZED = "v5.1" .. "t9", 
    BIG_TEXT = "v5.2" .. "t9", 
    STICKY_BAR = "v5.3" .. "t9", 
    CONSOLE = "v5.4" .. "m2"
};
local v23 = {
    UNIBAR = "v6.1" .. "t9", 
    PINNED_CHAT = "v6.2" .. "t9", 
    DEFAULT_OPEN = "v6.3" .. "t9"
};
local v24 = {
    UNIBAR = "v7.1.1" .. "t9", 
    FTUX = "v7.2.1" .. "t9", 
    OCCLUSION = "v7.3" .. "t9"
};
local v25 = {
    [v17] = true, 
    [v18] = false, 
    [v19] = false, 
    [v21.BASELINE] = false, 
    [v21.OLD_LAYOUT] = false, 
    [v21.HOME_BUTTON] = false, 
    [v22.MODERNIZED] = true, 
    [v22.BIG_TEXT] = false, 
    [v22.STICKY_BAR] = false, 
    [v22.CONSOLE] = true, 
    [v23.UNIBAR] = not v9, 
    [v23.PINNED_CHAT] = not v10, 
    [v23.DEFAULT_OPEN] = not v11, 
    [v20] = false, 
    [v24.UNIBAR] = not v12, 
    [v24.FTUX] = not v13, 
    [v24.OCCLUSION] = not v14
};
local v26 = {};
v26.__index = v26;
v26.getCachedVersion = function()
    local l_status_0, l_result_0 = pcall(function()
        return l_AppStorageService_0:GetItem("ExperienceMenuVersion");
    end);
    if not (l_status_0 and l_result_0 ~= "") or not v25[l_result_0] then
        return nil;
    else
        return l_result_0;
    end;
end;
v26.getCSATQualificationThreshold = function()
    return v16;
end;
v26.v1VersionId = function()
    return v17;
end;
v26.v2VersionId = function()
    return v18;
end;
v26.v3VersionId = function()
    return v19;
end;
v26.reportAbuseMenuV2VersionId = function()
    return v20;
end;
v26.controlsBaselineVersionId = function()
    return v21.BASELINE;
end;
v26.controlsOldLayoutVersionId = function()
    return v21.OLD_LAYOUT;
end;
v26.controlsHomeButtonVersionId = function()
    return v21.HOME_BUTTON;
end;
v26.modernizationModernizedVersionId = function()
    return v22.MODERNIZED;
end;
v26.modernizationBigTextVersionId = function()
    return v22.BIG_TEXT;
end;
v26.modernizationStickyBarVersionId = function()
    return v22.STICKY_BAR;
end;
v26.consoleModernizationVersionId = function()
    return v22.CONSOLE;
end;
v26.chromeVersionId = function()
    return v23.UNIBAR;
end;
v26.chromePinnedChatVersionId = function()
    return v23.PINNED_CHAT;
end;
v26.chromeDefaultOpenVersionId = function()
    return v23.DEFAULT_OPEN;
end;
v26.chromeFollowupVersionId = function()
    return v24.UNIBAR;
end;
v26.chromeFTUXVersionId = function()
    return v24.FTUX;
end;
v26.chromeOcclusionVersionId = function()
    return v24.OCCLUSION;
end;
parseCountData = function(v29)
    if not v29 or typeof(v29) ~= "string" then
        return nil, nil;
    else
        local v30 = v29:split(":");
        return v30[1], v30[2];
    end;
end;
v26.new = function(v31)
    local v32 = {
        _currentMenuVersion = nil, 
        _currentMenuVersionIsDefault = false, 
        _isCSATQualified = nil, 
        _ixpServiceWrapper = v31 or v5
    };
    setmetatable(v32, v26);
    return v32;
end;
v26.getVersion = function(v33)
    if v6() then
        if not v33._currentMenuVersion then
            local v34 = v33.getCachedVersion();
            if v34 ~= nil and v34 ~= "" then
                v33._currentMenuVersion = v34;
            else
                v33._currentMenuVersionIsDefault = true;
                v33._currentMenuVersion = v17;
            end;
        end;
        return v33._currentMenuVersion;
    else
        return v17;
    end;
end;
v26.isV2MenuEnabled = function(v35)
    return v35:getVersion() == v18;
end;
v26.isV3MenuEnabled = function(v36)
    return v36:getVersion() == v19;
end;
v26.isReportAbuseMenuV2Enabled = function(v37)
    return v37:getVersion() == v20;
end;
v26.areMenuControlsEnabled = function(v38)
    for _, v40 in pairs(v21) do
        if v38:getVersion() == v40 then
            return true;
        end;
    end;
    return false;
end;
v26.shouldShowNewNavigationLayout = function(v41)
    local v42 = true;
    if v41:getVersion() ~= v21.BASELINE then
        v42 = v41:getVersion() == v21.HOME_BUTTON;
    end;
    return v42;
end;
v26.shouldShowHomeButton = function(v43)
    return v43:getVersion() == v21.HOME_BUTTON;
end;
v26.isMenuModernizationEnabled = function(v44)
    for _, v46 in pairs(v22) do
        if v44:getVersion() == v46 then
            return true;
        end;
    end;
    return false;
end;
v26.shouldShowBiggerText = function(v47)
    return v47:getVersion() == v22.BIG_TEXT;
end;
v26.shouldShowStickyBar = function(v48)
    return v48:getVersion() == v22.STICKY_BAR;
end;
v26.isChromeEnabled = function(v49)
    for _, v51 in v23, nil, nil do
        if v49:getVersion() == v51 then
            return true;
        end;
    end;
    for _, v53 in v24, nil, nil do
        if v49:getVersion() == v53 then
            return true;
        end;
    end;
    return false;
end;
v26.shouldPinChat = function(v54)
    for _, v56 in v24, nil, nil do
        if v54:getVersion() == v56 then
            return true;
        end;
    end;
    return v54:getVersion() == v23.PINNED_CHAT;
end;
v26.shouldDefaultOpen = function(v57)
    local v58 = true;
    if v57:getVersion() ~= v23.DEFAULT_OPEN then
        v58 = true;
        if v57:getVersion() ~= v24.UNIBAR then
            v58 = v57:getVersion() == v24.OCCLUSION;
        end;
    end;
    return v58;
end;
v26.shouldShowFTUX = function(v59)
    return v59:getVersion() == v24.FTUX;
end;
v26.initialize = function(v60)
    if v6() then
        local l_status_1, l_result_1 = pcall(function()
            return v60._ixpServiceWrapper:GetLayerData(v7());
        end);
        local v63 = nil;
        local v64 = nil;
        if l_GetFFlagEnableNewExperienceMenuLayer_0() then
            local l_status_2, l_result_2 = pcall(function()
                return v60._ixpServiceWrapper:GetLayerData(v8());
            end);
            v63 = l_status_2;
            v64 = l_result_2;
        end;
        if l_status_1 or v63 and l_GetFFlagEnableNewExperienceMenuLayer_0() then
            if not v60._currentMenuVersion then
                v60._currentMenuVersion = v60.getCachedVersion();
            end;
            if not l_GetFFlagEnableNewExperienceMenuLayer_0() then
                if not (not l_result_1 or l_result_1.menuVersion == v60._currentMenuVersion and not v60._currentMenuVersionIsDefault) then
                    pcall(function()
                        l_AppStorageService_0:SetItem("ExperienceMenuVersion", l_result_1.menuVersion or "");
                        l_AppStorageService_0:Flush();
                    end);
                end;
            elseif not (not l_result_1 or not v64) then
                if not v64.menuVersion or l_result_1.menuVersion then
                    if not (l_result_1.menuVersion == v60._currentMenuVersion and not v60._currentMenuVersionIsDefault) then
                        pcall(function()
                            l_AppStorageService_0:SetItem("ExperienceMenuVersion", l_result_1.menuVersion or "");
                            l_AppStorageService_0:Flush();
                        end);
                    end;
                elseif not (v64.menuVersion == v60._currentMenuVersion and not v60._currentMenuVersionIsDefault) then
                    pcall(function()
                        l_AppStorageService_0:SetItem("ExperienceMenuVersion", v64.menuVersion);
                        l_AppStorageService_0:Flush();
                    end);
                end;
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v26.default = v26.new();
return v26;
