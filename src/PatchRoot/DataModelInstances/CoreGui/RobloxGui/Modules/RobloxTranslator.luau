local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Translator_0 = l_CoreGui_0.CoreScriptLocalization:GetTranslator("en-us");
if l_Players_0.LocalPlayer == nil then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
local v4 = nil;
local function _()
    if v4 == nil then
        v4 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
    end;
    return v4;
end;
local v6 = {};
local function _(v7)
    local v8 = v6[v7];
    if not v8 then
        v8 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(v7);
        v6[v7] = v8;
        return v8;
    else
        return v8;
    end;
end;
local function v15(v10, v11, v12)
    local l_status_0, l_result_0 = pcall(function()
        return v12:FormatByKey(v10, v11);
    end);
    if not l_status_0 then
        if v12.LocaleId == "zh-cjv" then
            return "";
        else
            return l_Translator_0:FormatByKey(v10, v11);
        end;
    else
        return l_result_0;
    end;
end;
return {
    FormatByKey = function(_, v17, v18)
        local l_v15_0 = v15;
        local l_v17_0 = v17;
        local l_v18_0 = v18;
        if v4 == nil then
            v4 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
        end;
        return l_v15_0(l_v17_0, l_v18_0, v4);
    end, 
    FormatByKeyForLocale = function(_, v23, v24, v25)
        local l_v15_1 = v15;
        local l_v23_0 = v23;
        local l_v25_0 = v25;
        local v29 = v6[v24];
        local v30;
        if not v29 then
            v29 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(v24);
            v6[v24] = v29;
            v30 = v29;
        else
            v30 = v29;
        end;
        return l_v15_1(l_v23_0, l_v25_0, v30);
    end
};
