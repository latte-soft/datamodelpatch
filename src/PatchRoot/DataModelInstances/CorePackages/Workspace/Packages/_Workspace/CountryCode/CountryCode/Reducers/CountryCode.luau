local l_script_FirstAncestor_0 = script:FindFirstAncestor("CountryCode");
return require(l_script_FirstAncestor_0.Parent.Rodux).createReducer("", {
    [require(l_script_FirstAncestor_0.Actions.ReceivedUserCountryCode).name] = function(_, v2)
        return v2.countryCode;
    end
});
