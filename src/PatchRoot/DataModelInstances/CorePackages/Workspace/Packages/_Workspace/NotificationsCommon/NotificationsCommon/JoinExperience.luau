local l_Parent_0 = script.Parent.Parent;
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local l_isSubjectToDesktopPolicies_0 = require(l_Parent_0.SharedFlags).isSubjectToDesktopPolicies;
local l_FFlagEnableToastNotificationsForMobile_0 = require(l_Parent_0.SharedFlags).FFlagEnableToastNotificationsForMobile;
local l_GetFFlagEnableShareLinkInExperienceToastNotificationFix_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableShareLinkInExperienceToastNotificationFix;
return function(v5, v6)
    return pcall(function()
        if not ((not l_FFlagEnableToastNotificationsForMobile_0() or not v6) or l_isSubjectToDesktopPolicies_0()) then
            game:Shutdown();
        end;
        l_default_0:isURLRegistered(v5):andThen(function(v7)
            if not v7 then
                if not (not l_GetFFlagEnableShareLinkInExperienceToastNotificationFix_0() or not v6) then
                    game:Shutdown();
                    l_default_0:detectURL(v5);
                end;
                return ;
            else
                l_default_0:detectURL(v5);
                return ;
            end;
        end);
    end);
end;
