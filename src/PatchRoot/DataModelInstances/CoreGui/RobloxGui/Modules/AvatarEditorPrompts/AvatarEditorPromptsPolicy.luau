local v0 = require(game:GetService("CorePackages").PolicyProvider);
local v1 = v0.withGetPolicyImplementation((v0.GetPolicyImplementations.MemStorageService("app-policy")));
v1.Mapper = function(v2)
    return {
        getCustomOutfitNames = function()
            if v2.CustomCostumeNames ~= nil then
                return v2.CustomCostumeNames;
            else
                return true;
            end;
        end
    };
end;
return v1;
