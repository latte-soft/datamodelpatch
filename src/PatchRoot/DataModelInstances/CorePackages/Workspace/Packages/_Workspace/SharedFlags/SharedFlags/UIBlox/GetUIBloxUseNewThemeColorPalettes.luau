local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_IXPService_0 = game:GetService("IXPService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v4 = require(script.Parent.Parent.GetEnableDesignSystemExperiment);
game:DefineFastFlag("UIBloxUseNewThemeColorPalettes", false);
game:DefineFastFlag("LuaAppColorSystem1_1TestEnabled1", false);
game:DefineFastFlag("LuaAppColorSystem1_1TestCache1", false);
game:DefineFastString("LuaAppColorSystem1_1TestLayerName", "DesignSystem.DesignToken");
game:DefineFastString("LuaAppColorSystem1_1TestFieldName", "colorVersion");
game:DefineFastInt("UIBloxUseNewThemeColorPalettesRollout", 0);
local v11 = {
    _experimentCacheKey = "ExperimentCache", 
    getCachedLayerVariables = function(v5, v6)
        local l_status_0, l_result_0 = pcall(function()
            return l_AppStorageService_0:GetItem(v5._experimentCacheKey);
        end);
        if l_status_0 then
            local l_status_1, l_result_1 = pcall(function()
                return l_HttpService_0:JSONDecode(l_result_0);
            end);
            if l_status_1 then
                return l_result_1[v6] or nil;
            end;
        end;
        return nil;
    end
};
local function _(v12)
    if not v12 then
        return false;
    elseif v12 == "v1.1" then
        return true;
    elseif v12 == "v1" then
        return false;
    else
        return false;
    end;
end;
local function v22()
    if game:GetFastFlag("LuaAppColorSystem1_1TestEnabled1") then
        local l_LuaAppColorSystem1_1TestCache1_0 = game:GetFastFlag("LuaAppColorSystem1_1TestCache1");
        local l_game_FastString_0 = game:GetFastString("LuaAppColorSystem1_1TestLayerName");
        local l_game_FastString_1 = game:GetFastString("LuaAppColorSystem1_1TestFieldName");
        if not l_LuaAppColorSystem1_1TestCache1_0 then
            local l_status_2, l_result_2 = pcall(function()
                return l_IXPService_0:GetUserLayerVariables(l_game_FastString_0);
            end);
            if not l_status_2 then
                return false;
            else
                local v19 = l_result_2[l_game_FastString_1] or nil;
                if not v19 then
                    return false;
                elseif v19 == "v1.1" then
                    return true;
                elseif v19 == "v1" then
                    return false;
                else
                    return false;
                end;
            end;
        else
            local v20 = v11:getCachedLayerVariables(l_game_FastString_0);
            if not v20 then
                return false;
            else
                local v21 = v20[l_game_FastString_1] or nil;
                if not v21 then
                    return false;
                elseif v21 == "v1.1" then
                    return true;
                elseif v21 == "v1" then
                    return false;
                else
                    return false;
                end;
            end;
        end;
    else
        return false;
    end;
end;
local function _()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        return false;
    else
        return l_LocalPlayer_0.UserId % 100 < game:GetFastInt("UIBloxUseNewThemeColorPalettesRollout");
    end;
end;
return function()
    if not game:GetFastFlag("UIBloxUseNewThemeColorPalettes") then
        if not v4() then
            if not v22() then
                local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                if not l_LocalPlayer_1 then
                    return false;
                else
                    return l_LocalPlayer_1.UserId % 100 < game:GetFastInt("UIBloxUseNewThemeColorPalettesRollout");
                end;
            else
                return true;
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
