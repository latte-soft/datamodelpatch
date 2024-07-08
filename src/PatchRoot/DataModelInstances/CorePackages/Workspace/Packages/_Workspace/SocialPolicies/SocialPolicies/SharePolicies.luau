local l_isSubjectToDesktopPolicies_0 = require(script.Parent.Parent.SharedFlags).isSubjectToDesktopPolicies;
return function(v1)
    return {
        getAccountProviderName = function()
            return v1.AccountProviderName or "";
        end, 
        shouldShowGameDetailsShareButton = function()
            if not l_isSubjectToDesktopPolicies_0() then
                return v1.GameDetailsShareButton or false;
            else
                return false;
            end;
        end, 
        shouldShowCatalogShareButton = function()
            if not l_isSubjectToDesktopPolicies_0() then
                return v1.CatalogShareButton or false;
            else
                return false;
            end;
        end, 
        shouldShareToAccountProvider = function()
            return v1.ShareToAccountProvider or false;
        end, 
        shouldInviteFromAccountProvider = function()
            return v1.InviteFromAccountProvider or false;
        end, 
        getShareToAccountProviderTimeout = function()
            return v1.ShareToAccountProviderTimeout or 5;
        end
    };
end;
