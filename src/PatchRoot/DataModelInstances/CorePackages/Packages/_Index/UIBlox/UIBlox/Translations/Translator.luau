local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.GeneratedTranslations);
local function _(v5)
    if not l_GuiService_0:FindFirstChild(v3.LOCALIZATION_TABLE_NAME) then
        local l_LocalizationTable_0 = Instance.new("LocalizationTable");
        l_LocalizationTable_0.Name = v3.LOCALIZATION_TABLE_NAME;
        l_LocalizationTable_0.Archivable = false;
        l_LocalizationTable_0.SourceLocaleId = "en-us";
        l_LocalizationTable_0:SetEntries(v4);
        l_LocalizationTable_0.Parent = v5;
        return ;
    else
        return ;
    end;
end;
if not l_GuiService_0:FindFirstChild(v3.LOCALIZATION_TABLE_NAME) then
    local l_LocalizationTable_1 = Instance.new("LocalizationTable");
    l_LocalizationTable_1.Name = v3.LOCALIZATION_TABLE_NAME;
    l_LocalizationTable_1.Archivable = false;
    l_LocalizationTable_1.SourceLocaleId = "en-us";
    l_LocalizationTable_1:SetEntries(v4);
    l_LocalizationTable_1.Parent = l_GuiService_0;
end;
local l_Translator_0 = l_GuiService_0.UIBloxLocalization:GetTranslator("en-us");
local v10 = {};
local function _(v11)
    local v12 = v10[v11];
    if not v12 then
        v12 = l_GuiService_0.UIBloxLocalization:GetTranslator(v11);
        v10[v11] = v12;
        return v12;
    else
        return v12;
    end;
end;
local function _()
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v15 = v10[l_RobloxLocaleId_0];
    if not v15 then
        v15 = l_GuiService_0.UIBloxLocalization:GetTranslator(l_RobloxLocaleId_0);
        v10[l_RobloxLocaleId_0] = v15;
        return v15;
    else
        return v15;
    end;
end;
local function v22(v17, v18, v19)
    local l_status_0, l_result_0 = pcall(function()
        return v19:FormatByKey(v17, v18);
    end);
    if not l_status_0 then
        if v19.LocaleId == "zh-cjv" then
            return "";
        else
            return l_Translator_0:FormatByKey(v17, v18);
        end;
    else
        return l_result_0;
    end;
end;
return {
    FormatByKey = function(_, v24, v25)
        local l_v22_0 = v22;
        local l_v24_0 = v24;
        local l_v25_0 = v25;
        local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
        local v30 = v10[l_RobloxLocaleId_1];
        local v31;
        if not v30 then
            v30 = l_GuiService_0.UIBloxLocalization:GetTranslator(l_RobloxLocaleId_1);
            v10[l_RobloxLocaleId_1] = v30;
            v31 = v30;
        else
            v31 = v30;
        end;
        return l_v22_0(l_v24_0, l_v25_0, v31);
    end, 
    FormatByKeyForLocale = function(_, v33, v34, v35)
        local l_v22_1 = v22;
        local l_v33_0 = v33;
        local l_v35_0 = v35;
        local v39 = v10[v34];
        local v40;
        if not v39 then
            v39 = l_GuiService_0.UIBloxLocalization:GetTranslator(v34);
            v10[v34] = v39;
            v40 = v39;
        else
            v40 = v39;
        end;
        return l_v22_1(l_v33_0, l_v35_0, v40);
    end
};
