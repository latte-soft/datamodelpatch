local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Networking.createOrGetProfileShareUrl);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
return function()
    local v4 = l_useDispatch_0();
    return function()
        return v4(v2.API()):catch(function()
        end);
    end;
end;
