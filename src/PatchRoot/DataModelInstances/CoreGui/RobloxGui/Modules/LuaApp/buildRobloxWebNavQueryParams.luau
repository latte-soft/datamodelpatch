local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.LocalStorageKey);
local function _()
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v2.AppInstallationId);
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        return l_l_AppStorageService_0_Item_0;
    else
        return "unknown";
    end;
end;
local function _()
    local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem(v2.BrowserTrackerId);
    if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
        return l_l_AppStorageService_0_Item_1;
    else
        return "0";
    end;
end;
return function(v7)
    local v8 = {
        utm_content = v7.utm_content, 
        utm_source = v7.utm_source or "UAP", 
        utm_app_version = v7.utm_app_version or l_RunService_0:GetRobloxVersion()
    };
    local l_utm_app_id_0 = v7.utm_app_id;
    if not l_utm_app_id_0 then
        local l_l_AppStorageService_0_Item_2 = l_AppStorageService_0:GetItem(v2.AppInstallationId);
        l_utm_app_id_0 = if not not l_l_AppStorageService_0_Item_2 and l_l_AppStorageService_0_Item_2 ~= "" then l_l_AppStorageService_0_Item_2 else "unknown";
    end;
    v8.utm_app_id = l_utm_app_id_0;
    l_utm_app_id_0 = v7.utm_btid;
    if not l_utm_app_id_0 then
        local l_l_AppStorageService_0_Item_3 = l_AppStorageService_0:GetItem(v2.BrowserTrackerId);
        l_utm_app_id_0 = if not not l_l_AppStorageService_0_Item_3 and l_l_AppStorageService_0_Item_3 ~= "" then l_l_AppStorageService_0_Item_3 else "0";
    end;
    v8.utm_btid = l_utm_app_id_0;
    return v8;
end;
