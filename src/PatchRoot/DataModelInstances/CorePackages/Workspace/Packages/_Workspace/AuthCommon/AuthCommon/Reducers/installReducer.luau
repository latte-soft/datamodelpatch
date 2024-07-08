local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Reducers.CountryCodeList);
return function()
    return v1.combineReducers({
        CountryCodeList = v2
    });
end;
