local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell);
local l_CrossPlayCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useEffectOnMount_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount;
local v9 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local v10 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreStatusButton);
local l_BodyText_0 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText;
local _ = require(script.Parent.Types);
local function _(v13, v14)
    local v15 = not v13.isEnabled and "" or "(" .. v14.recommended .. ") ";
    if not v13.isLoading then
        if not v13.hasError then
            if not v13.isEnabled then
                return v15 .. v14.disabled;
            else
                return v15 .. v14.enabled;
            end;
        else
            return v15 .. v14.error;
        end;
    else
        return v15 .. v14.loading;
    end;
end;
local function _(v17)
    return ((v17 and v17.Success) and v17.CanJoinGame) and v17.PrivilegeCheckResult == "NoIssue";
end;
local function v28(v19, v20, v21, v22)
    local v23 = {
        [l_CrossPlayCapabilities_0.CrossPlatform] = v21.crossPlatform, 
        [l_CrossPlayCapabilities_0.Multiplayer] = v21.multiplayer, 
        [l_CrossPlayCapabilities_0.SharedContent] = v21.sharedContent
    };
    return v2.map(v19, function(v24)
        local v25 = v20[v24];
        local v26 = ((v25 and v25.Success) and v25.CanJoinGame) and v25.PrivilegeCheckResult == "NoIssue";
        v25 = v20[v24] and v20[v24].PrivilegeCheckResult == "Error";
        local _ = nil;
        return {
            label = v23[v24], 
            status = if not v22 then if v25 then v21.error else if v26 then v21.allowed else v21.disallowed else v21.loading
        };
    end);
end;
local function v34(v29)
    local v30 = v4.useCrossPlaySettings();
    local v31 = l_useLocalization_0({
        multiplayer = "Feature.Settings.Label.Multiplayer", 
        sharedContent = "Feature.Settings.Label.SharedContent", 
        recommended = "Feature.Settings.Label.Recommended", 
        enabled = "Feature.Settings.Label.Enabled", 
        disabled = "Feature.Settings.Label.Disabled", 
        loading = "Feature.Settings.Label.Loading", 
        error = "Feature.Settings.Label.Error", 
        allowed = "Feature.Settings.Label.Allowed", 
        disallowed = "Feature.Settings.Label.Disallowed"
    });
    local v32 = not v30.isEnabled and "" or "(" .. v31.recommended .. ") ";
    local v33 = if not v30.isLoading then if v30.hasError then v32 .. v31.error else if v30.isEnabled then v32 .. v31.enabled else v32 .. v31.disabled else v32 .. v31.loading;
    v32 = v3.useMemo(function()
        return v28(v29, v30.systemPrivileges, v31, v30.isLoading);
    end, {
        v30, 
        v29, 
        v31
    });
    l_useEffectOnMount_0(function()
        v30.reload();
    end);
    return (v3.useMemo(function()
        return {
            crossPlaySettings = v30, 
            crossPlayStatusText = v33, 
            privilegeStatuses = v32
        };
    end, {
        v30, 
        v33, 
        v32
    }));
end;
local function _(v35, v36, v37)
    return v2.reduce(v36, function(v38, v39)
        local l_v38_0 = v38;
        if l_v38_0 then
            local v41 = v37[v39];
            l_v38_0 = ((v41 and v41.Success) and v41.CanJoinGame) and v41.PrivilegeCheckResult == "NoIssue";
        end;
        return l_v38_0;
    end, v35.isEnabled);
end;
return function(v43)
    local v45 = v7(function(v44)
        return v44.getPlatformAccountName();
    end);
    local v46 = l_useLocalization_0({
        platformAccountSettingsSuccess = {
            "Feature.Settings.Description.PlatformAccountSettingsSuccess"; 
            platform = v45
        }, 
        platformAccountSettings = {
            "Feature.Settings.Heading.PlatformAccountSettings"; 
            platform = v45
        }, 
        crossPlatform = "Feature.Settings.Label.CrossPlatform", 
        crossPlatformDescription = "Feature.Settings.Description.CrossPlatform"
    });
    local v48 = v7(function(v47)
        return (v47.getCrossPlayCapabilities());
    end);
    local v49 = v34(v48);
    local l_crossPlaySettings_0 = v49.crossPlaySettings;
    local l_crossPlayStatusText_0 = v49.crossPlayStatusText;
    local v54 = v2.map(v49.privilegeStatuses, function(v52, v53)
        return v3.createElement(v10, {
            layoutOrder = v53 + 2, 
            title = v52.label, 
            status = v52.status, 
            onActivated = l_crossPlaySettings_0.invokeSystemUi
        });
    end);
    local l_systemPrivileges_0 = l_crossPlaySettings_0.systemPrivileges;
    return v3.createElement(v9, {
        layoutOrder = v43.layoutOrder, 
        withDivider = v43.withDivider, 
        title = v46.platformAccountSettings
    }, v2.append({
        v3.createElement(v10, {
            layoutOrder = 1, 
            title = v46.crossPlatform, 
            status = l_crossPlayStatusText_0, 
            isDisabled = l_crossPlaySettings_0.isLoading, 
            onActivated = l_crossPlaySettings_0.toggle
        }), 
        v3.createElement(l_BodyText_0, {
            layoutOrder = 2, 
            text = v46.crossPlatformDescription
        })
    }, v54, {
        if not v2.reduce(v48, function(v56, v57)
            local l_v56_0 = v56;
            if l_v56_0 then
                local v59 = l_systemPrivileges_0[v57];
                l_v56_0 = ((v59 and v59.Success) and v59.CanJoinGame) and v59.PrivilegeCheckResult == "NoIssue";
            end;
            return l_v56_0;
        end, l_crossPlaySettings_0.isEnabled) then nil else v3.createElement(l_BodyText_0, {
            layoutOrder = 10, 
            text = v46.platformAccountSettingsSuccess
        })
    }));
end;
