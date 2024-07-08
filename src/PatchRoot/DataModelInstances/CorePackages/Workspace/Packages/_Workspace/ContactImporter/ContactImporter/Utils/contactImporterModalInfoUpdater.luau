local v0 = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS);
return {
    addSeenCount = function(_, v3, v4)
        if l_game_EngineFeature_0 then
            local l_status_0, l_result_0 = pcall(function()
                return v3:GetItem(v0.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT);
            end);
            if l_status_0 then
                local v7 = "";
                if l_result_0 == "" then
                    v7 = v4 .. ":" .. "1";
                else
                    local v8 = false;
                    for v9 in string.gmatch(l_result_0 or "", "([^,]+)") do
                        local v10 = string.split(v9, ":");
                        local v11 = v10[1];
                        local v12 = tonumber(v10[2]) or 0;
                        if v11 == v4 then
                            v8 = true;
                            v12 = v12 + 1;
                        end;
                        local v13 = v11 .. ":" .. tostring(v12);
                        if v7 ~= "" then
                            v7 = v7 .. "," .. v13;
                        else
                            v7 = v13;
                        end;
                    end;
                    if not v8 then
                        v7 = v7 .. "," .. v4 .. ":" .. "1";
                    end;
                end;
                do
                    local l_v7_0 = v7;
                    pcall(function()
                        v3:SetItem(v0.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT, l_v7_0);
                        v3:Flush();
                    end);
                end;
            end;
            return ;
        else
            return ;
        end;
    end, 
    updateTimestamp = function(_, v16, v17, v18)
        if l_game_EngineFeature_0 then
            local l_status_1, l_result_1 = pcall(function()
                return v16:GetItem(v0.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP);
            end);
            if l_status_1 then
                local v21 = "";
                if l_result_1 == "" then
                    v21 = v17 .. ":" .. tostring(v18);
                else
                    local v22 = false;
                    for v23 in string.gmatch(l_result_1 or "", "([^,]+)") do
                        local v24 = string.split(v23, ":");
                        local v25 = v24[1];
                        local v26 = v24[2];
                        if v25 == v17 then
                            v26 = tostring(v18);
                            v22 = true;
                        end;
                        local v27 = v25 .. ":" .. tostring(v26);
                        if v21 ~= "" then
                            v21 = v21 .. "," .. v27;
                        else
                            v21 = v27;
                        end;
                    end;
                    if not v22 then
                        v21 = v21 .. "," .. v17 .. ":" .. tostring(v18);
                    end;
                end;
                do
                    local l_v21_0 = v21;
                    pcall(function()
                        v16:SetItem(v0.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP, l_v21_0);
                        v16:Flush();
                    end);
                end;
            end;
            return ;
        else
            return ;
        end;
    end
};
