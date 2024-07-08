local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.FormFactor);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function()
    return l_useSelector_0(function(v3)
        return v3.FormFactor == v1.Enums.FormFactor.WIDE;
    end);
end;
