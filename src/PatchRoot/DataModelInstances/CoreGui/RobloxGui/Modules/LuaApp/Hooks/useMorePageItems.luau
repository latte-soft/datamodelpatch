local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v7 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v8 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableReportLogsButton);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagForceEnableReportLogsButton);
return function(v11)
    local v13 = v6(function(v12)
        return v11 or v12.getMorePageType();
    end);
    local v15 = v6(function(v14)
        return (v14.getWebViewSupport());
    end);
    local v17 = v6(function(v16)
        return (v16.getDisableIAPEntryPoint());
    end);
    local v19 = v6(function(v18)
        return (v18.getGiftCardsEnabled());
    end);
    local v21 = v6(function(v20)
        return (v20.getOfficialStoreEnabled());
    end);
    local v23 = v6(function(v22)
        return (v22.getSupportsOverscan());
    end);
    local v25 = l_useSelector_0(function(v24)
        return v24.NotificationBadgeCounts;
    end);
    local v28 = l_useSelector_0(function(v26)
        local v27 = v26.Users[v26.LocalUserId];
        if not v27 then
            return false;
        else
            return v27.membership == Enum.MembershipType.Premium;
        end;
    end);
    local v29 = nil;
    if not (not v10() and not v9()) then
        v29 = l_useUserExperiment_0({
            v7.AppHealthReportLogs
        }, function(v30)
            return (v30[v7.AppHealthReportLogs] or {}).ReportLogsButtonEnabled or nil;
        end);
    end;
    return v2.useMemo(function()
        return v1.map(v8.GetItemsInPage(v13, v28, nil, {
            giftCardsEnabled = v19, 
            officialStoreEnabled = v21
        }, nil, not v15, v17, v23, nil, v29), function(v31)
            return v1.join(v31, {
                contents = v1.map(v31.contents, function(v32)
                    local v33 = 0;
                    if v32.itemType == v8.ItemType.Friends then
                        v33 = v25.MorePageFriends;
                    elseif v32.itemType == v8.ItemType.Messages then
                        v33 = v25.MorePageMessages;
                    elseif not (v32.itemType ~= v8.ItemType.Settings) or v32.itemType == v8.ItemType.Settings_AccountInfo then
                        v33 = v25.MorePageSettings;
                    elseif v32.itemType == v8.ItemType.TencentNoticeCenter then
                        v33 = v25.MorePageTencentUnreadNotice;
                    end;
                    if v32.badgeCount ~= v33 then
                        return v1.join(v32, {
                            badgeCount = v33
                        });
                    else
                        return v32;
                    end;
                end)
            });
        end);
    end, {
        v13, 
        v15, 
        v17, 
        v19, 
        v21, 
        v25, 
        v28
    });
end;
