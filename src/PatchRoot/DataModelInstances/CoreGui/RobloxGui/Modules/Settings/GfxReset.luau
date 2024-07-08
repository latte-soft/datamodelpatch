local l_GameSettings_0 = UserSettings().GameSettings;
local v1 = game:DefineFastFlag("IGMResetGfxQuality", false);
local v2 = game:DefineFastFlag("IGMRevertGfxQuality", false);
local v3 = game:DefineFastFlag("IGMRevertGfxLv5Only", false);
local v4 = game:DefineFastFlag("IGMResetGfxLv5Only", false);
local v5 = game:DefineFastFlag("IGMAlwaysResetGfxLv5", false);
local v6 = game:DefineFastInt("IGMTempOverrideGfxLv5", 0);
local _ = function(v7)
    for _, v9 in (Enum.SavedQualitySetting:GetEnumItems()), nil, nil do
        if v9.Value == v7 then
            return v9;
        end;
    end;
    return Enum.SavedQualitySetting.Automatic;
end;
local function v20()
    local l_v5_0 = v5;
    local v12 = l_GameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel5;
    if not (not l_v5_0 or not v12) then
        l_GameSettings_0.SavedQualityLevel = Enum.SavedQualitySetting.Automatic;
    end;
    if game:GetEngineFeature("QualityLevelReset") then
        if not v2 then
            if v1 then
                local l_v4_0 = v4;
                local l_QualityResetLevel_0 = l_GameSettings_0.QualityResetLevel;
                if not (l_QualityResetLevel_0 >= 0) or l_QualityResetLevel_0 == nil then
                    local l_Value_0 = l_GameSettings_0.SavedQualityLevel.Value;
                    if v12 and l_v4_0 or l_v4_0 == false then
                        l_GameSettings_0.SavedQualityLevel = Enum.SavedQualitySetting.Automatic;
                    end;
                    l_GameSettings_0.QualityResetLevel = l_Value_0;
                end;
            end;
        elseif l_GameSettings_0.QualityResetLevel >= 0 then
            local l_QualityResetLevel_1 = l_GameSettings_0.QualityResetLevel;
            local v17;
            for _, v19 in (Enum.SavedQualitySetting:GetEnumItems()), nil, nil do
                if v19.Value == l_QualityResetLevel_1 then
                    v17 = v19;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v17 = Enum.SavedQualitySetting.Automatic;
            ::label0::;
            if not (not v3 or v17 ~= Enum.SavedQualitySetting.QualityLevel5) or v3 == false then
                l_GameSettings_0.SavedQualityLevel = v17;
                l_GameSettings_0.QualityResetLevel = -1;
                return ;
            end;
        end;
    end;
end;
applicationId = function()
    local l_AppStorageService_0 = game:GetService("AppStorageService");
    if l_AppStorageService_0 then
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("AppInstallationId");
        local v23 = typeof(l_l_AppStorageService_0_Item_0);
        if v23 == "number" then
            return tonumber(l_l_AppStorageService_0_Item_0) or nil;
        elseif v23 == "string" then
            if string.len(l_l_AppStorageService_0_Item_0) <= 0 then
                return nil;
            else
                return (tonumber((string.sub(l_l_AppStorageService_0_Item_0, -string.len((tostring(1000)))))));
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
return {
    RunGfxReset = v20, 
    TemporaryOverride = function(v24)
        if ((applicationId() or 0) + 329) % 1000 < v6 and (not (v24 ~= Enum.SavedQualitySetting.QualityLevel5) or v24 == Enum.SavedQualitySetting.QualityLevel5.Value) then
            return true, Enum.SavedQualitySetting.Automatic.Value;
        else
            return false, Enum.SavedQualitySetting.Automatic.Value;
        end;
    end
};
