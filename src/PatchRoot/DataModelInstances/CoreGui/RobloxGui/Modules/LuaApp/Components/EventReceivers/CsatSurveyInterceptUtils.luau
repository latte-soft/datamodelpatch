local l_AppStorageService_0 = game:GetService("AppStorageService");
local v1 = require(script.Parent.CsatSurveyConstants);
local v2 = "v1" .. "t9";
local v3 = {
    UNIBAR = "v7.1.1" .. "t9", 
    FTUX = "v7.2.1" .. "t9"
};
canShowChromeSurvey = function(v4)
    if not (v4 ~= "") or v4 == nil then
        return false;
    else
        local v5 = getCurrentMenuVersion();
        local v6 = false;
        for _, v8 in v3, nil, nil do
            if v4 == v8 and v4 == v5 then
                v6 = true;
                break;
            end;
        end;
        local v9 = false;
        if v4 == v2 then
            v9 = v4 == v5;
        end;
        return v6;
    end;
end;
getCurrentMenuVersion = function()
    local l_status_0, l_result_0 = pcall(function()
        return l_AppStorageService_0:GetItem(v1.LOCAL_STORAGE_KEY_EXPERIENCE_MENU_VERSION);
    end);
    if l_status_0 and l_result_0 ~= "" then
        return l_result_0;
    else
        return "";
    end;
end;
return {
    canShowChromeSurvey = canShowChromeSurvey
};
