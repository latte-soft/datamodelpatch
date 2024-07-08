local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v4 = require(l_script_FirstAncestor_0.Http.Requests.GetCountryCodes);
local v5 = require(l_script_FirstAncestor_0.Models.CountryCode);
local v6 = require(l_script_FirstAncestor_0.Actions.SetCountryCodeList);
local v12 = {
    _updateStoreWithCountryCodes = function(v7, v8)
        local v9 = {};
        for v10, v11 in pairs(v8.responseBody) do
            v9[v10] = v5.fromJSON(v11);
        end;
        v7:dispatch(v6(v9));
        return v2.resolve();
    end
};
v12.Fetch = function(v13)
    return l_PerformFetch_0.Single("luaapp.countriesapi.countrycodes", function(v14)
        return v4(v13):andThen(function(v15)
            if not v15 or not v15.responseBody then
                return v2.reject();
            else
                return v12._updateStoreWithCountryCodes(v14, v15);
            end;
        end);
    end);
end;
v12.GetFetchingStatus = function(v16)
    return l_PerformFetch_0.GetStatus(v16, "luaapp.countriesapi.countrycodes");
end;
return v12;
