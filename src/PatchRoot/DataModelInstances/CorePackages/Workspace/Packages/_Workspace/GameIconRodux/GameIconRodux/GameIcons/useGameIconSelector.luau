local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameIconRodux");
local v1 = require(l_script_FirstAncestor_0.GameIcons.GameIconReducer);
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v3)
    return (l_useSelector_0(function(v4)
        return v4[v1.key][v3];
    end));
end;
