local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v5 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v6 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v7 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v8 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
return function(v9)
    return function(v10)
        local v11 = v7();
        if l_getAppFeaturePolicies_0().getShowVNGAge12Badge() and v11 == v8.Web then
            v10:dispatch(v5(function()
                v10:dispatch(v3({
                    name = v2.GenericWebPage, 
                    detail = "https://shop.vnggames.com/global", 
                    extraProps = {
                        onClose = v9
                    }
                }));
                v10:dispatch(v6());
            end));
            return ;
        else
            v10:dispatch(v3({
                name = v2.PurchaseRobux
            }));
            return ;
        end;
    end;
end;
