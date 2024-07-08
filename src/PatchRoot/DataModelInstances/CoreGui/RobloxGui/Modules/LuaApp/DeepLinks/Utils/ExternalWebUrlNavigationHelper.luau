local v0 = {
    Zendesk = "zendesk"
};
local v1 = {
    PolicyUpdate = "policy_update"
};
local function v6(v2)
    local v3 = {
        ["zh-cn"] = "zh-cn", 
        zh_cn = "zh-cn", 
        ["zh-cjv"] = "zh-cn", 
        zh_cjv = "zh-cn", 
        ["zh-hans"] = "zh-cn", 
        zh_hans = "zh-cn", 
        ["zh-tw"] = "zh-tw", 
        zh_tw = "zh-tw", 
        ["zh-hant"] = "zh-tw", 
        zh_hant = "zh-tw", 
        ["en-us"] = "en-us", 
        en_us = "en-us", 
        en = "en-us", 
        ["en-gb"] = "en-gb", 
        en_gb = "en-gb", 
        ["fr-ca"] = "fr-ca", 
        fr_ca = "fr-ca", 
        nb = "no", 
        ["nb-no"] = "no", 
        nb_no = "no"
    };
    if not v3[v2] then
        local v4 = {};
        for v5 in v2:gmatch("([^%-_]+)") do
            table.insert(v4, v5);
        end;
        if not v4[1] then
            return "en";
        else
            return v4[1];
        end;
    else
        return v3[v2];
    end;
end;
return {
    ExternalWebDomainEnum = v0, 
    ExternalWebPageTypeEnum = v1, 
    getZendeskUrl = function(v7)
        local v8 = "https://en.help.roblox.com/hc/";
        local l_locale_0 = v7.locale;
        v8 = if not (not not l_locale_0 and not not string.match(l_locale_0, "^[%w%-_]+$")) then v8 .. "en-us" else v8 .. v6(v7.locale);
        l_locale_0 = v7.articleid;
        if not not l_locale_0 and not not string.match(l_locale_0, "^[a-zA-Z0-9]+$") then
            v8 = v8 .. "/articles/" .. v7.articleid;
        end;
        return v8;
    end, 
    getZendeskWebViewTitleKey = function(v10)
        if v10 == v1.PolicyUpdate then
            return "Feature.Notifications.Webview.Title.PolicyUpdate";
        else
            return "CommonUI.Features.Label.Help";
        end;
    end, 
    getExternalLocale = v6, 
    isValidLocale = function(v11)
        if not v11 then
            return false;
        else
            return not not string.match(v11, "^[%w%-_]+$");
        end;
    end, 
    isValidArticleId = function(v12)
        if not v12 then
            return false;
        else
            return not not string.match(v12, "^[a-zA-Z0-9]+$");
        end;
    end
};
