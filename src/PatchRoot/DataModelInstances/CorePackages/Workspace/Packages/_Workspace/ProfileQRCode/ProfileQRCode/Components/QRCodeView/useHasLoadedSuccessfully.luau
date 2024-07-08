local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local v4 = require(l_script_FirstAncestor_0.Rodux.useShareLinkId);
local _ = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
return function(v6, v7)
    local v8 = v4();
    l_useEffectOnce_0(function()
        v6.fireEvent(v2.QRPageLoad, {
            shareLinkId = v8
        });
    end, v7);
end;
