local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local v1 = require(l_script_FirstAncestor_0.Parent.RoactUtils);
local l_screenSizeSelector_0 = require(l_script_FirstAncestor_0.Common.Utils).screenSizeSelector;
local l_getMiddleContentWidth_0 = require(l_script_FirstAncestor_0.Common.Utils).getMiddleContentWidth;
local l_useSelector_0 = v1.Hooks.RoactRodux.useSelector;
return function(v5)
    local v6 = l_getMiddleContentWidth_0(l_useSelector_0(l_screenSizeSelector_0).X);
    return function()
        return v5(v6);
    end;
end;
