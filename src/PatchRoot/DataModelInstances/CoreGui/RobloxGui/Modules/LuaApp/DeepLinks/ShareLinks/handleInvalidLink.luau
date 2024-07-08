local _ = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Reducers.Navigation);
local l_AppPage_0 = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppEnums).AppPage;
local v2 = require(script.Parent.LinkStatus);
local _ = require(script.Parent.Types);
return function(v4, v5)
    local l_shareLinksAnalytics_0 = v5.analyticsImpls.shareLinksAnalytics;
    local l_code_0 = v4.code;
    local l_type_0 = v4.type;
    l_shareLinksAnalytics_0.resolveLink({
        isViaAppsFlyer = v4.isViaAppsFlyer, 
        linkId = l_code_0, 
        linkStatus = v2.Invalid, 
        linkType = l_type_0
    });
    return {
        {
            {
                name = l_AppPage_0.Home
            }, 
            {
                name = l_AppPage_0.ShareLinkInvalidModal, 
                extraProps = {
                    closeModal = function()
                        l_shareLinksAnalytics_0.errorDialogButtonClick({
                            linkId = l_code_0, 
                            linkStatus = v2.Invalid, 
                            linkType = l_type_0
                        });
                    end
                }
            }
        }
    };
end;
