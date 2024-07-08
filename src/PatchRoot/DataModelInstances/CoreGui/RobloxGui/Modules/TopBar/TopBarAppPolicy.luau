local v0 = require(game:GetService("CorePackages").PolicyProvider);
local v1 = v0.withGetPolicyImplementation((v0.GetPolicyImplementations.MemStorageService("app-policy")));
local v2 = require(script.Parent.Parent.Flags.GetFFlagAddOver12TopBarBadge);
v1.Mapper = function(v3)
    return {
        getDisplayVoiceBetaBadge = function()
            return v3.DisplayVoiceBetaBadge or false;
        end, 
        showBadgeOver12 = function()
            return not not v2() and (v3.ShowBadgeOver12 or false);
        end
    };
end;
return v1;
