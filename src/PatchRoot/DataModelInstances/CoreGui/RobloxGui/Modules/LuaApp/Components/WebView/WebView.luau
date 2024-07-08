local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.tutils);
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v5 = require(l_Modules_0.LuaApp.Components.WebViewStub);
local _ = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol);
local function _(v7, v8)
    if v3.deepEqual(v7, v8) then
        return nil;
    else
        return v7;
    end;
end;
local function _(v10)
    return {
        url = v10.url, 
        title = v10.title, 
        isVisible = v10.isVisible, 
        windowType = v10.windowType, 
        searchParams = v10.searchParams, 
        transitionAnimation = v10.transitionAnimation
    };
end;
local function v16(v12, v13)
    local v14 = {};
    local l_url_0 = v12.url;
    v14.url = if v3.deepEqual(l_url_0, v13.url) then nil else l_url_0;
    l_url_0 = v12.title;
    v14.title = if v3.deepEqual(l_url_0, v13.title) then nil else l_url_0;
    l_url_0 = v12.isVisible;
    v14.isVisible = if v3.deepEqual(l_url_0, v13.isVisible) then nil else l_url_0;
    l_url_0 = v12.windowType;
    v14.windowType = if v3.deepEqual(l_url_0, v13.windowType) then nil else l_url_0;
    l_url_0 = v12.searchParams;
    v14.searchParams = if v3.deepEqual(l_url_0, v13.searchParams) then nil else l_url_0;
    l_url_0 = v12.transitionAnimation;
    v14.transitionAnimation = if v3.deepEqual(l_url_0, v13.transitionAnimation) then nil else l_url_0;
    return v14;
end;
local function v22(v17, v18)
    local l_webViewProtocol_0 = v17.webViewProtocol;
    local l_windowCloseCallback_0 = v17.windowCloseCallback;
    local l_javaScriptCallback_0 = v17.javaScriptCallback;
    v2.useEffect(function()
        if v18 then
            if l_windowCloseCallback_0 == nil then
                return ;
            else
                assert(l_windowCloseCallback_0);
                l_webViewProtocol_0:listenForWindowClose(l_windowCloseCallback_0);
                return function()
                    l_webViewProtocol_0:stopListeningForWindowClose();
                end;
            end;
        else
            return ;
        end;
    end, {
        v18, 
        l_windowCloseCallback_0
    });
    v2.useEffect(function()
        if v18 then
            if l_javaScriptCallback_0 == nil then
                return ;
            else
                assert(l_javaScriptCallback_0);
                l_webViewProtocol_0:listenForJavaScript(l_javaScriptCallback_0);
                return function()
                    l_webViewProtocol_0:stopListeningForJavaScript();
                end;
            end;
        else
            return ;
        end;
    end, {
        v18, 
        l_javaScriptCallback_0
    });
end;
local function v29(v23, v24)
    local l_webViewProtocol_1 = v23.webViewProtocol;
    local v26 = {
        url = v23.url, 
        title = v23.title, 
        isVisible = v23.isVisible, 
        windowType = v23.windowType, 
        searchParams = v23.searchParams, 
        transitionAnimation = v23.transitionAnimation
    };
    local v27 = l_usePrevious_0(v26);
    local v28 = l_usePrevious_0(v24);
    v2.useEffect(function()
        if v24 then
            l_webViewProtocol_1:openWindow(v26);
            return function()
                l_webViewProtocol_1:closeWindow();
            end;
        else
            return ;
        end;
    end, {
        v24
    });
    v2.useEffect(function()
        if v24 then
            if v28 then
                assert(v27);
                l_webViewProtocol_1:mutateWindow((v16(v26, v27)));
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v26.url, 
        v26.title, 
        v26.isVisible, 
        v26.windowType, 
        v26.searchParams and v26.searchParams.searchType, 
        v26.transitionAnimation
    });
end;
local function _(v30, v31)
    local l_webViewProtocol_2 = v30.webViewProtocol;
    v2.useEffect(function()
        return (l_webViewProtocol_2:request(function()
            v31(true);
        end));
    end, {});
end;
local function _(v34)
    local v35, v36 = v2.useState(false);
    v22(v34, v35);
    v29(v34, v35);
    local l_webViewProtocol_3 = v34.webViewProtocol;
    v2.useEffect(function()
        return (l_webViewProtocol_3:request(function()
            v36(true);
        end));
    end, {});
end;
return function(v39)
    local v40, v41 = v2.useState(false);
    v22(v39, v40);
    v29(v39, v40);
    local l_webViewProtocol_4 = v39.webViewProtocol;
    v2.useEffect(function()
        return (l_webViewProtocol_4:request(function()
            v41(true);
        end));
    end, {});
    v40 = v39.overlayProps or {};
    return v2.createElement(v5, {
        isVisible = v40.isVisible, 
        DisplayOrder = v40.DisplayOrder
    });
end;
