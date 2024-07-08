local v0 = require(script.dependencies);
local v1 = require(script.Parent.Parent.Parent.Parent.t);
local l_TokenPackageIndexMap_0 = v0.TokenPackageIndexMap;
local l_GetTokenGenerators_0 = v0.GetTokenGenerators;
local l_Validators_0 = v0.SchemaPackage.Validators;
local v5 = require(script.Types);
local v6 = require(script.Parent.Constants);
local function _(v7, v8)
    local v9 = l_TokenPackageIndexMap_0[v7];
    assert(v9 ~= nil, "Wrong platform specified");
    local v10 = v9[v8:lower()];
    if v10 == nil then
        v10 = v9[v6.DefaultThemeName:lower()];
    end;
    assert(v10 ~= nil, "Wrong theme specified");
    return v10;
end;
local function _(v12)
    if v12 == v6.DeviceType.Console then
        return 1.5;
    else
        return 1;
    end;
end;
return {
    getTokens = function(v14, v15, v16, v17)
        if not v16 then
            local v18 = l_TokenPackageIndexMap_0[v14];
            assert(v18 ~= nil, "Wrong platform specified");
            local v19 = v18[v15:lower()];
            if v19 == nil then
                v19 = v18[v6.DefaultThemeName:lower()];
            end;
            assert(v19 ~= nil, "Wrong theme specified");
            local l_v19_0 = v19;
            return {
                Global = require(l_v19_0.Global), 
                Semantic = require(l_v19_0.Semantic), 
                Component = require(l_v19_0.Component)
            };
        else
            local v21 = l_GetTokenGenerators_0(v15, v17) or l_GetTokenGenerators_0(v6.DefaultThemeName, v17);
            local v22 = v14 == v6.DeviceType.Console and 1.5 or 1;
            return {
                Global = require(v21.Global)(v22), 
                Semantic = require(v21.Semantic)(v22), 
                Component = require(v21.Component)(v22)
            };
        end;
    end, 
    validateTokens = v1.strictInterface({
        Global = v1.strictInterface(l_Validators_0.Global), 
        Semantic = v1.strictInterface(l_Validators_0.Semantic), 
        Component = v1.strictInterface(l_Validators_0.Component)
    }), 
    Types = v5
};
