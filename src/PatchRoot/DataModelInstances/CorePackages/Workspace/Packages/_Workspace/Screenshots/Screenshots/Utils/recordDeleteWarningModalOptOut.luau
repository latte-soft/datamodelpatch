local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Parent.Dash);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Analytics.EventNames);
local v6 = require(l_Parent_0.Utils.getLocalUserId);
local v7 = require(l_Parent_0.Utils.getUserIdsFromString);
return function(v8)
    local l_status_0, l_result_0 = pcall(function()
        return l_AppStorageService_0:GetItem(v4.DeleteWarningModalOptOutStorageKey);
    end);
    if l_status_0 then
        local v11 = v7(l_result_0);
        v11[v6(l_Players_0) or ""] = true;
        local v12 = table.concat(v3.keys(v11), ",");
        local l_status_1, _ = pcall(function()
            l_AppStorageService_0:SetItem(v4.DeleteWarningModalOptOutStorageKey, v12);
            l_AppStorageService_0:Flush();
        end);
        if l_status_1 then
            v8.fireEvent(v5.CapturesDeleteWarningModalOptedOut);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
