local v0 = require(game:GetService("CorePackages").Packages.React);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local v2 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry);
local l_useRegisterFocusNavigableSurface_0 = v2.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = v2.useDeRegisterFocusNavigableSurface;
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
return function(v6, v7)
    local v8 = l_useRegisterFocusNavigableSurface_0();
    local v9 = l_useDeRegisterFocusNavigableSurface_0();
    v0.useEffect(function()
        if not v6 then
            v9(v7, v6);
        else
            v8(v7, v6);
        end;
        return function()
            v9(v7, v6);
        end;
    end, {
        v6, 
        v7, 
        v8, 
        v9
    });
end;
