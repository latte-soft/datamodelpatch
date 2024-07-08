local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v2.ENGINE_FEATURE_STORAGE_KEY);
return {
    AddUser = function(_, v5)
        if l_game_EngineFeature_0 then
            local l_status_0, l_result_0 = pcall(function()
                return l_AppStorageService_0:GetItem(v2.TOAST_SEEN_STORAGE_KEY);
            end);
            if l_status_0 then
                local v8 = {
                    [1] = v5
                };
                if l_result_0 ~= nil and l_result_0 ~= "" then
                    local v9 = #v8 + 1;
                    for v10 in string.gmatch(l_result_0, "([^,]+)") do
                        if v10 == v5 then
                            return ;
                        else
                            v8[v9] = v10;
                            v9 = v9 + 1;
                        end;
                    end;
                end;
                local v11 = table.concat(v8, ","):gsub("%s+", "");
                do
                    local l_v11_0 = v11;
                    pcall(function()
                        l_AppStorageService_0:SetItem(v2.TOAST_SEEN_STORAGE_KEY, l_v11_0);
                        l_AppStorageService_0:Flush();
                    end);
                end;
            end;
            return ;
        else
            return ;
        end;
    end, 
    CheckUserHasNotSeen = function(_, v14)
        if l_game_EngineFeature_0 then
            local l_status_1, l_result_1 = pcall(function()
                return l_AppStorageService_0:GetItem(v2.TOAST_SEEN_STORAGE_KEY);
            end);
            if l_status_1 then
                for v17 in string.gmatch(l_result_1 or "", "([^,]+)") do
                    if v14 == v17 then
                        return false;
                    end;
                end;
            end;
            return true;
        else
            return false;
        end;
    end, 
    CheckUserHasNotOptedIn = function(_, v19)
        if l_game_EngineFeature_0 then
            local l_status_2, l_result_2 = pcall(function()
                return l_AppStorageService_0:GetItem(v2.OPTED_IN_USERS_STORAGE_KEY);
            end);
            if l_status_2 then
                for v22 in string.gmatch(l_result_2 or "", "([^,]+)") do
                    if v19 == v22 then
                        return false;
                    end;
                end;
            end;
            return true;
        else
            return false;
        end;
    end
};
