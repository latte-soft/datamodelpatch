local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Parent.RoactUtils);
local v3 = require(l_Parent_0.Constants);
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
local function v5()
    pcall(function()
        l_AppStorageService_0:SetItem(v3.LastFlashOccurrenceTsLocalStorageKey, (tostring(DateTime.now().UnixTimestampMillis)));
        l_AppStorageService_0:Flush();
    end);
end;
return function(v6)
    local v7 = v6 or l_AppStorageService_0;
    if l_useSelector_0(function(v8)
        return v8.Screenshots.IsOverlayFlashActive;
    end) then
        local l_status_0, l_result_0 = pcall(function()
            return v7:GetItem(v3.LastFlashOccurrenceTsLocalStorageKey);
        end);
        if l_status_0 then
            local v11 = tonumber(l_result_0);
            if v11 == nil then
                return false, v5;
            else
                assert(v11 ~= nil, "lastFlashOccurrenceTs cannot be nil");
                if DateTime.now().UnixTimestampMillis - v11 < 500 then
                    return false, v5;
                else
                    return true, v5;
                end;
            end;
        else
            return false, v5;
        end;
    else
        return false, v5;
    end;
end;
