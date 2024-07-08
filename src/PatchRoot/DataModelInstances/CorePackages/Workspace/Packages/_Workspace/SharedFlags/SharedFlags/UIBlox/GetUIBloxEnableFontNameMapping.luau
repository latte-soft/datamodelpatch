local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = game:DefineFastFlag("UIBloxDevUseNewFontNameMapping", false);
local v3 = game:DefineFastFlag("UIBloxDevBypassValidation", false);
local v4 = game:DefineFastFlag("UIBloxEnableFontNameMappingFlagCaching", false);
local v5 = nil;
local v6 = game:DefineFastFlag("EnableNewFontNameMappingABTest2", false);
local v13 = {
    _experimentCacheKey = "ExperimentCache", 
    getCachedLayerVariables = function(v7, v8)
        local l_status_0, l_result_0 = pcall(function()
            return l_AppStorageService_0:GetItem(v7._experimentCacheKey);
        end);
        if l_status_0 then
            local l_status_1, l_result_1 = pcall(function()
                return l_HttpService_0:JSONDecode(l_result_0);
            end);
            if l_status_1 then
                return l_result_1[v8] or nil;
            end;
        end;
        return nil;
    end
};
local function _()
    local v14 = v13:getCachedLayerVariables("DesignSystem.Font");
    if not v14 then
        return false;
    else
        local v15 = v14.FontNameVariant or nil;
        if v15 == nil then
            return false;
        else
            return tonumber(v15) == 1;
        end;
    end;
end;
local function _()
    if game:GetEngineFeature("HaveBuilderSansFont") then
        local l_v2_0 = v2;
        local l_v3_0 = v3;
        if not l_v2_0 or l_v3_0 then
            if v6 then
                if not _G.__TESTEZ_RUNNING_TEST__ then
                    local v19 = v13:getCachedLayerVariables("DesignSystem.Font");
                    if not v19 then
                        return false;
                    else
                        local v20 = v19.FontNameVariant or nil;
                        if v20 == nil then
                            return false;
                        else
                            return tonumber(v20) == 1;
                        end;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return true;
        end;
    else
        return false;
    end;
end;
return function()
    if v4 then
        if v5 == nil then
            local v22;
            if game:GetEngineFeature("HaveBuilderSansFont") then
                local l_v2_1 = v2;
                local l_v3_1 = v3;
                if not l_v2_1 or l_v3_1 then
                    if v6 then
                        if not _G.__TESTEZ_RUNNING_TEST__ then
                            local v25 = v13:getCachedLayerVariables("DesignSystem.Font");
                            if not v25 then
                                v22 = false;
                            else
                                local v26 = v25.FontNameVariant or nil;
                                v22 = v26 ~= nil and tonumber(v26) == 1;
                            end;
                        else
                            v22 = false;
                        end;
                    else
                        v22 = false;
                    end;
                else
                    v22 = true;
                end;
            else
                v22 = false;
            end;
            v5 = v22;
        end;
        return v5;
    elseif game:GetEngineFeature("HaveBuilderSansFont") then
        local l_v2_2 = v2;
        local l_v3_2 = v3;
        if not l_v2_2 or l_v3_2 then
            if v6 then
                if not _G.__TESTEZ_RUNNING_TEST__ then
                    local v29 = v13:getCachedLayerVariables("DesignSystem.Font");
                    if not v29 then
                        return false;
                    else
                        local v30 = v29.FontNameVariant or nil;
                        if v30 == nil then
                            return false;
                        else
                            return tonumber(v30) == 1;
                        end;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return true;
        end;
    else
        return false;
    end;
end;
