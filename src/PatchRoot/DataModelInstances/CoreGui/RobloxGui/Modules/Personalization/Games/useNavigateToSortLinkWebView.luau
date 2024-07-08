local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v3 = require(l_CorePackages_0.Workspace.Packages.React);
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local v9 = require(l_CorePackages_0.Packages.t);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v11 = v9.strictInterface({
    action = v9.string, 
    linkPath = v9.string, 
    webViewSupported = v9.boolean, 
    gameSetTypeId = v9.optional(v9.string), 
    durationInSeconds = v9.optional(v9.number)
});
local function _(v12)
    local v13, v14 = v11(v12);
    if not v13 then
        l_mutedError_0(v14);
    end;
end;
return function()
    local v16 = l_useNavigation_0();
    local v18 = l_useAppPolicy_0(function(v17)
        return v17.getWebViewSupport();
    end);
    local v19 = l_useRoactService_0(l_AppEventIngestService_0);
    return v3.useCallback(function(v20, v21, v22, v23, v24)
        local function _(v25, v26)
            local v27 = {
                linkPath = v20, 
                action = v25, 
                gameSetTypeId = v23, 
                webViewSupported = v18, 
                durationInSeconds = v26
            };
            local v28, v29 = v11(v27);
            if not v28 then
                l_mutedError_0(v29);
            end;
            v19:sendEventDeferred(v21, "navigateToSortLink", v27);
        end;
        local v31 = {
            linkPath = v20, 
            action = "click", 
            gameSetTypeId = v23, 
            webViewSupported = v18, 
            durationInSeconds = nil
        };
        local v32, v33 = v11(v31);
        if not v32 then
            l_mutedError_0(v33);
        end;
        v19:sendEventDeferred(v21, "navigateToSortLink", v31);
        if not v18 then
            warn("WebView is not supported on this platform");
            return ;
        else
            v31 = l_UrlBuilder_0.fromString(if string.find(v20, "/") == 1 then v20:gsub("/", "www:", 1) else v20)();
            v32 = os.clock();
            v33 = {
                linkPath = v20, 
                action = "open", 
                gameSetTypeId = v23, 
                webViewSupported = v18, 
                durationInSeconds = nil
            };
            local v34, v35 = v11(v33);
            if not v34 then
                l_mutedError_0(v35);
            end;
            v19:sendEventDeferred(v21, "navigateToSortLink", v33);
            v16.navigate(l_AppPage_0.GenericWebPage, {
                detail = v31, 
                extraProps = {
                    title = v22, 
                    onClose = function()
                        local v36 = {
                            linkPath = v20, 
                            action = "close", 
                            gameSetTypeId = v23, 
                            webViewSupported = v18, 
                            durationInSeconds = os.clock() - v32
                        };
                        local v37, v38 = v11(v36);
                        if not v37 then
                            l_mutedError_0(v38);
                        end;
                        v19:sendEventDeferred(v21, "navigateToSortLink", v36);
                        if v24 then
                            v24();
                        end;
                    end
                }
            });
            return ;
        end;
    end, {
        v16, 
        v18
    });
end;
