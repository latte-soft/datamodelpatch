local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Chat_0 = game:GetService("Chat");
local v2 = {
    System = "InGame.Chat.Label.SystemMessagePrefix", 
    Team = "InGame.Chat.Label.TeamMessagePrefix"
};
local v3 = {
    ["From(%s.+)"] = {
        English = "From", 
        LocalizationKey = "InGame.Chat.Label.From"
    }, 
    ["To(%s.+)"] = {
        English = "To", 
        LocalizationKey = "InGame.Chat.Label.To"
    }
};
return {
    _hasFetchedLocalization = false, 
    _getTranslator = function(v4)
        if not (v4._translator or v4._hasFetchedLocalization) then
            v4._hasFetchedLocalization = true;
            local v5 = l_Chat_0:WaitForChild("ChatLocalization", 4);
            if not v5 then
                warn("Missing ChatLocalization. Chat interface will not be localized.");
            else
                v4._translator = v5:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
                l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
                    v4._hasFetchedLocalization = false;
                    v4._translator = nil;
                end);
            end;
        end;
        return v4._translator;
    end, 
    Get = function(v6, v7, v8, v9)
        local l_v8_0 = v8;
        pcall(function()
            local v11 = v6:_getTranslator();
            if not v11 then
                warn("Missing Translator. Used default for", v7);
                return ;
            else
                l_v8_0 = v11:FormatByKey(v7, v9);
                return ;
            end;
        end);
        return l_v8_0;
    end, 
    LocalizeFormattedMessage = function(v12, v13)
        local v14, v15 = string.find(v13, "{RBX_LOCALIZATION_KEY}");
        if v14 then
            local v16, v17 = string.find(v13, "{RBX_LOCALIZATION_DEFAULT}");
            if v16 then
                local v18, v19 = string.find(v13, "{RBX_LOCALIZATION_PARAMS}");
                local v20 = string.sub(v13, v15 + 1, v16 - 1);
                local v21 = nil;
                if v18 then
                    v21 = string.sub(v13, v17 + 1, v18 - 1);
                    local v22 = string.sub(v13, v19 + 1);
                    local v23 = {};
                    for v24, v25 in string.gmatch(v22, "([^%s]+)=([^%s]+)") do
                        v23[v24] = v25;
                    end;
                    return v12:Get(v20, v21, v23);
                else
                    return v12:Get(v20, (string.sub(v13, v17 + 1)));
                end;
            else
                return v13;
            end;
        else
            return v13;
        end;
    end, 
    FormatMessageToSend = function(_, v27, v28, v29, v30)
        if not v29 or not v30 then
            return "{RBX_LOCALIZATION_KEY}" .. v27 .. "{RBX_LOCALIZATION_DEFAULT}" .. v28;
        else
            return "{RBX_LOCALIZATION_KEY}" .. v27 .. "{RBX_LOCALIZATION_DEFAULT}" .. v28 .. "{RBX_LOCALIZATION_PARAMS}" .. v29 .. "=" .. v30;
        end;
    end, 
    tryLocalize = function(v31, v32)
        if not v2[v32] then
            for v33, v34 in pairs(v2) do
                if string.find(v32, v33) then
                    return string.gsub(v32, v33, v31:Get(v34, v33), 1);
                end;
            end;
            for v35, v36 in pairs(v3) do
                local v37 = string.find(v32, v35);
                local v38 = string.match(v32, v35);
                if not (not v37 or not v38) then
                    return if v37 > 1 then v32:sub(1, v37 - 1) else "" .. v31:Get(v36.LocalizationKey, v36.English) .. v38;
                end;
            end;
            return v32;
        else
            return v31:Get(v2[v32], v32);
        end;
    end
};
