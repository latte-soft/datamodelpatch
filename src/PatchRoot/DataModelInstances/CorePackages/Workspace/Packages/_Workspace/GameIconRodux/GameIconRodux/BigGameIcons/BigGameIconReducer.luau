local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameIconRodux");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.BigGameIcons.SetBigGameIcons);
return {
    key = "BigGameIconsKey", 
    reducer = function(v3, v4)
        v3 = v3 or {};
        if v4.type == v2.name then
            v3 = v1.Dictionary.join(v3, v4.gameIcons);
        end;
        return v3;
    end
};
