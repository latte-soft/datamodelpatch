local v0 = require(script.Parent.Parent.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS);
return {
    clearLocalStorage = function(_, v3)
        if l_game_EngineFeature_0 then
            pcall(function()
                v3:SetItem(v0.LOCAL_STORAGE_KEY_OPTED_IN_USERS, "");
                v3:Flush();
            end);
            return ;
        else
            return ;
        end;
    end, 
    addUserToLocalStorage = function(_, v5, v6)
        if l_game_EngineFeature_0 then
            local l_status_0, l_result_0 = pcall(function()
                return v5:GetItem(v0.LOCAL_STORAGE_KEY_OPTED_IN_USERS);
            end);
            if l_status_0 then
                local v9 = {
                    [1] = v6
                };
                if l_result_0 ~= nil and l_result_0 ~= "" then
                    local v10 = #v9 + 1;
                    for v11 in string.gmatch(l_result_0, "([^,]+)") do
                        if v11 == v6 then
                            return ;
                        else
                            v9[v10] = v11;
                            v10 = v10 + 1;
                        end;
                    end;
                end;
                local v12 = table.concat(v9, ","):gsub("%s+", "");
                do
                    local l_v12_0 = v12;
                    pcall(function()
                        v5:SetItem(v0.LOCAL_STORAGE_KEY_OPTED_IN_USERS, l_v12_0);
                        v5:Flush();
                    end);
                end;
            end;
            return ;
        else
            return ;
        end;
    end
};
