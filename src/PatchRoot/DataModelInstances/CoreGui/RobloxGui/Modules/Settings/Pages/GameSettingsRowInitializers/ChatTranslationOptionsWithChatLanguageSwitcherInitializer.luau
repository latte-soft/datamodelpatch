local l_TextChatService_0 = game:GetService("TextChatService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.Url);
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v8 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v9 = game:DefineFastFlag("FixChatLanguageSwitcherLabel", false);
local v10 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationEnabledLocales);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
return function(v12, v13, v14)
    local v15 = {
        [1] = "en_us"
    };
    local v16 = {
        en_us = 1
    };
    local v17 = {
        "English"
    };
    local v18 = v3.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
    local v19 = l_HttpService_0:RequestInternal({
        Url = v18, 
        Method = "GET"
    });
    local function v68(v20, v21)
        if not v20 then
            if v21 == nil then
                v21 = "Locales call did not set error message to non-nil value";
            end;
            v8:warning("GameSettings chat language selector initialization failed to get all required information; defaulting to unavailable for the remainder of this session. Error message: " .. v21);
            if not v9 then
                local l_v12_0 = v12;
                local l_v12_1 = v12;
                local l_v12_2 = v12;
                local v25, v26, v27 = v7:AddNewRow(v12, "Chat Language", "DropDown", {
                    "Unavailable"
                }, 1);
                l_v12_0.ChatLanguageSelectorFrame = v25;
                l_v12_1.ChatLanguageSelectorLabel = v26;
                l_v12_2.ChatLanguageSelectorMode = v27;
            else
                local l_v12_3 = v12;
                local l_v12_4 = v12;
                local l_v12_5 = v12;
                local v31, v32, v33 = v7:AddNewRow(v12, "Chat Translation Language", "DropDown", {
                    "Unavailable"
                }, 1);
                l_v12_3.ChatLanguageSelectorFrame = v31;
                l_v12_4.ChatLanguageSelectorLabel = v32;
                l_v12_5.ChatLanguageSelectorMode = v33;
            end;
            v12.ChatLanguageSelectorFrame.LayoutOrder = v13.ChatLanguageSelectorFrame;
        end;
        local v34 = nil;
        local l_ChatTranslationLocale_0 = l_GameSettings_0.ChatTranslationLocale;
        if l_ChatTranslationLocale_0 ~= "" then
            for v36, v37 in v15, nil, nil do
                if v37 == l_ChatTranslationLocale_0 then
                    v34 = v36;
                end;
            end;
        end;
        if not (l_ChatTranslationLocale_0 ~= "") or v34 == nil then
            for v38, v39 in v15, nil, nil do
                if v39 == l_LocalPlayer_0.LocaleId:gsub("-", "_") then
                    v34 = v38;
                    l_TextChatService_0.ChatTranslationEnabled = true;
                end;
            end;
        end;
        if v34 == nil then
            l_TextChatService_0.ChatTranslationEnabled = false;
            v34 = 1;
        else
            l_GameSettings_0.ChatTranslationLocale = v15[v34];
        end;
        l_LocalPlayer_0:SetChatTranslationSettingsLocaleId(v15[v34]);
        local v40 = v15[v34];
        if not v9 then
            local l_v12_6 = v12;
            local l_v12_7 = v12;
            local l_v12_8 = v12;
            local v44, v45, v46 = v7:AddNewRow(v12, "Chat Language", "DropDown", v17, v34);
            l_v12_6.ChatLanguageSelectorFrame = v44;
            l_v12_7.ChatLanguageSelectorLabel = v45;
            l_v12_8.ChatLanguageSelectorMode = v46;
        else
            local l_v12_9 = v12;
            local l_v12_10 = v12;
            local l_v12_11 = v12;
            local v50, v51, v52 = v7:AddNewRow(v12, "Chat Translation Language", "DropDown", v17, v34);
            l_v12_9.ChatLanguageSelectorFrame = v50;
            l_v12_10.ChatLanguageSelectorLabel = v51;
            l_v12_11.ChatLanguageSelectorMode = v52;
        end;
        v12.ChatLanguageSelectorFrame.LayoutOrder = v13.ChatLanguageSelectorFrame;
        v12.ChatLanguageSelectorMode.IndexChanged:connect(function(v53)
            l_GameSettings_0.ChatTranslationLocale = v15[v53];
            l_LocalPlayer_0:SetChatTranslationSettingsLocaleId(v15[v53]);
            v40 = v15[v53];
        end);
        local v54 = not l_TextChatService_0.ChatTranslationToggleEnabled and 2 or 1;
        local l_v12_12 = v12;
        local l_v12_13 = v12;
        local l_v12_14 = v12;
        local v58, v59, v60 = v7:AddNewRow(v12, "Option to View Untranslated Message", "Selector", {
            "On", 
            "Off"
        }, v54);
        l_v12_12.ChatTranslationToggleFrame = v58;
        l_v12_13.ChatTranslationToggleLabel = v59;
        l_v12_14.ChatTranslationToggleEnabler = v60;
        v12.ChatTranslationToggleFrame.LayoutOrder = v13.ChatTranslationToggleFrame;
        v12.ChatTranslationToggleEnabler.IndexChanged:connect(function(v61)
            local v62 = v61 == 1;
            local l_ChatTranslationToggleEnabled_0 = l_TextChatService_0.ChatTranslationToggleEnabled;
            if v62 ~= l_ChatTranslationToggleEnabled_0 then
                if not l_game_EngineFeature_0 then
                    l_TextChatService_0.ChatTranslationToggleEnabled = v62;
                else
                    l_GameSettings_0.ChatTranslationToggleEnabled = v62;
                end;
                v14("chat_translation_toggle", l_ChatTranslationToggleEnabled_0, v62, {
                    locale_id = v40
                });
            end;
        end);
        l_v12_12 = not l_TextChatService_0.ChatTranslationEnabled and 2 or 1;
        if l_v12_12 == 2 then
            v12.ChatLanguageSelectorFrame.Visible = false;
            v12.ChatTranslationToggleFrame.Visible = false;
        end;
        l_v12_13 = v12;
        l_v12_14 = v12;
        v58 = v12;
        local v64;
        v59, v60, v64 = v7:AddNewRow(v12, "Automatic Chat Translation", "Selector", {
            "On", 
            "Off"
        }, l_v12_12);
        l_v12_13.ChatTranslationFrame = v59;
        l_v12_14.ChatTranslationLabel = v60;
        v58.ChatTranslationEnabler = v64;
        v12.ChatTranslationFrame.LayoutOrder = v13.ChatTranslationFrame;
        v12.ChatTranslationEnabler.IndexChanged:connect(function(v65)
            local v66 = v65 == 1;
            local l_ChatTranslationEnabled_0 = l_TextChatService_0.ChatTranslationEnabled;
            if not l_game_EngineFeature_0 then
                l_TextChatService_0.ChatTranslationEnabled = v66;
            else
                l_GameSettings_0.ChatTranslationEnabled = v66;
            end;
            v14("chat_translation", l_ChatTranslationEnabled_0, v66, {
                locale_id = l_LocalPlayer_0.LocaleId
            });
            if v65 == 1 then
                v12.ChatLanguageSelectorFrame.Visible = true;
                v12.ChatTranslationToggleFrame.Visible = true;
                return ;
            else
                v12.ChatLanguageSelectorFrame.Visible = false;
                v12.ChatTranslationToggleFrame.Visible = false;
                return ;
            end;
        end);
    end;
    v19:Start(function(v69, v70)
        local v71 = false;
        local v72 = nil;
        if v69 then
            if v70.StatusCode == 401 then
                v72 = "Locale Code to Language Code Mapping Request: Unauthorized";
            elseif not (v70.StatusCode >= 200) or v70.StatusCode >= 400 then
                v72 = "Locale Code to Language Code Mapping Request Status code: " .. v70.StatusCode;
            else
                local l_status_0, l_result_0 = pcall(function()
                    local v73 = l_HttpService_0:JSONDecode(v70.Body);
                    local v74 = v10():gmatch("([^,]+)");
                    local v75 = {};
                    for v76 in v74, nil, nil do
                        table.insert(v75, v76);
                    end;
                    local _ = function(v77)
                        for _, v79 in v75, nil, nil do
                            if v79 == v77 then
                                return true;
                            end;
                        end;
                        return false;
                    end;
                    local v81 = 2;
                    for _, v83 in pairs(v73.data) do
                        local l_locale_0 = v83.locale.locale;
                        local l_name_0 = v83.locale.language.name;
                        if l_locale_0 == "en_us" then
                            v17[1] = l_name_0;
                        else
                            local v86;
                            for _, v88 in v75, nil, nil do
                                if v88 == l_locale_0 then
                                    v86 = true;
                                    goto label0 --[[  true, false  ]];
                                end;
                            end;
                            v86 = false;
                            ::label0::;
                            if v86 then
                                table.insert(v17, l_name_0);
                                v15[v81] = l_locale_0;
                                v16[l_locale_0] = v81;
                                v81 = v81 + 1;
                            end;
                        end;
                    end;
                end);
                v71 = l_status_0;
                v72 = l_result_0;
            end;
        else
            v72 = "Locale Code to Language Code Mapping Request: Connection error";
        end;
        if not v71 then
            v8:warning("GameSettings chat language selector initialization: Failed to get response from Localization API for " .. v18 .. " with error message: " .. v72);
        end;
        v68(v71, v72);
    end);
end;
