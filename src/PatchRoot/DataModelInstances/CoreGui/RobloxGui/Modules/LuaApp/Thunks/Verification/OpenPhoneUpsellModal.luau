local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v7 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAbstractPhoneUpsellFromCentralOverlay;
local l_GetFFlagAbstractShowWebpagePhoneUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAbstractShowWebpagePhoneUpsell;
return function(v10, v11)
    return function(v12)
        if l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
            v10.closeUpsell = function()
                return v12:dispatch(l_CloseCentralOverlay_0());
            end;
        end;
        if l_GetFFlagAbstractShowWebpagePhoneUpsell_0() then
            v10.showWebpage = function(v13)
                return v12:dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = v13, 
                    extraProps = {
                        title = "", 
                        transitionAnimation = v7.SlideInFromBottom
                    }
                }));
            end;
        end;
        if not v11 then
            v12:dispatch(v3(v2.PhoneVerificationUpsellOverlayWrapper, v10));
            return ;
        else
            v12:dispatch(v3(v2.VoicePhoneVerificationUpsellOverlayWrapper, v10));
            return ;
        end;
    end;
end;
