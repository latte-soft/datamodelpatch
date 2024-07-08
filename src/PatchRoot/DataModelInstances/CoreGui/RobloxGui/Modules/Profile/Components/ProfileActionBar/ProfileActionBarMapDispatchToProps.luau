local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
return function(v4)
    return {
        navigateDownToEditUsername = function(v5)
            v4(v1({
                name = v2.EditUsername, 
                extraProps = {
                    BrowserWrapperComponent = v3, 
                    showToast = v5
                }
            }));
        end, 
        navigateDownToPurchaseRobux = function()
            v4(v1({
                name = v2.PurchaseRobux, 
                extraProps = {}
            }));
        end
    };
end;
