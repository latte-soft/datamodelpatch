local l_AppStorageService_0 = game:GetService("AppStorageService");
game:DefineFastInt("PromiseMigrateTo0_3_4Rollout", 0);
game:DefineFastFlag("PromiseMigrateTo0_3_4", false);
return function()
    local l_game_FastInt_0 = game:GetFastInt("PromiseMigrateTo0_3_4Rollout");
    if not game:GetFastFlag("PromiseMigrateTo0_3_4") then
        if l_game_FastInt_0 <= 0 then
            return false;
        else
            local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("AppInstallationId");
            if typeof(l_l_AppStorageService_0_Item_0) == "string" then
                if string.len(l_l_AppStorageService_0_Item_0) <= 0 then
                    return l_game_FastInt_0 >= 100;
                else
                    local v3 = tonumber((string.sub(l_l_AppStorageService_0_Item_0, -2)));
                    if v3 == nil then
                        return l_game_FastInt_0 >= 100;
                    else
                        return v3 + 1 <= l_game_FastInt_0;
                    end;
                end;
            else
                return l_game_FastInt_0 >= 100;
            end;
        end;
    else
        return true;
    end;
end;
