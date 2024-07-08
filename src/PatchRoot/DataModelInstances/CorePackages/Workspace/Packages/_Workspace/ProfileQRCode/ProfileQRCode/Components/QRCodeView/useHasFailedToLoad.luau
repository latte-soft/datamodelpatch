local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local _ = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
return function(v5, v6)
    l_useEffectOnce_0(function()
        v5.fireEvent(v2.QRPageLoadFailed);
    end, v6);
end;
