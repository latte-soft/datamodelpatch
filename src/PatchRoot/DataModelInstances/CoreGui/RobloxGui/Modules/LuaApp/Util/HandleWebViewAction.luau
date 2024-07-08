local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales);
local v4 = require(l_Modules_0.LuaApp.AppPageProperties);
local v5 = require(l_Modules_0.LuaApp.WebViewProperties);
local v6 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local _ = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local _ = require(l_Modules_0.LuaApp.Navigation.NavigationTypes);
local function _(v9)
    return not not v9.detail and v9.name .. ":" .. v9.detail or v9.name;
end;
local function _(v11, v12)
    local l_url_0 = v12.url;
    local l_detail_0 = v11.detail;
    if type(l_url_0) == "function" then
        if type(l_detail_0) == "table" then
            return l_url_0(unpack(l_detail_0));
        else
            return l_url_0(l_detail_0);
        end;
    else
        return l_url_0 or l_detail_0;
    end;
end;
local function _(v16, v17, v18)
    local v19 = v16.titleKey or v17.titleKey;
    local l_title_0 = v16.title;
    if not v19 or l_title_0 then
        return l_title_0;
    else
        return v18:Format(v19);
    end;
end;
local function v29(v22, v23)
    local v24 = v5[v22.name] or {};
    local v25 = v22.extraProps or {};
    local v26 = {};
    local l_url_1 = v24.url;
    local l_detail_1 = v22.detail;
    v26.url = if type(l_url_1) == "function" then if type(l_detail_1) == "table" then l_url_1(unpack(l_detail_1)) else l_url_1(l_detail_1) else l_url_1 or l_detail_1;
    l_url_1 = v25.titleKey or v24.titleKey;
    l_detail_1 = v25.title;
    v26.title = if not l_url_1 then l_detail_1 else l_detail_1 or v23:Format(l_url_1);
    v26.webViewVisible = v25.webViewVisible;
    v26.searchParams = v25.searchParams or v24.searchParams;
    v26.transitionAnimation = v25.transitionAnimation or v24.transitionAnimation;
    v26.windowType = v24.windowType or v6.Default;
    return v26;
end;
local function _(v30, v31)
    local l_name_0 = v30.name;
    if v31 then
        local v33 = v31[l_name_0];
        if v33 then
            return v33.webView or false;
        end;
    end;
    return (v4[l_name_0] or {}).webView or false;
end;
local function _(v35)
    local l_onClose_0 = (v35.extraProps or {}).onClose;
    if l_onClose_0 then
        l_onClose_0();
    end;
end;
return function(v38, v39, v40, v41, v42)
    if (not not v38.detail and v38.name .. ":" .. v38.detail or v38.name) == (not not v39.detail and v39.name .. ":" .. v39.detail or v39.name) then
        return ;
    else
        local l_name_1 = v38.name;
        local v44;
        if v42 then
            local v45 = v42[l_name_1];
            if v45 then
                v44 = v45.webView or false;
                goto label0 --[[  true, true  ]];
            end;
        end;
        v44 = (v4[l_name_1] or {}).webView or false;
        ::label0::;
        if v44 then
            v41:closeWindow();
            l_name_1 = (v38.extraProps or {}).onClose;
            if l_name_1 then
                l_name_1();
            end;
        end;
        l_name_1 = v39.name;
        if v42 then
            local v46 = v42[l_name_1];
            if v46 then
                v44 = v46.webView or false;
                goto label1 --[[  true, true  ]];
            end;
        end;
        v44 = (v4[l_name_1] or {}).webView or false;
        ::label1::;
        if v44 then
            v41:openWindow((v29(v39, v40)));
        end;
        return ;
    end;
end;
