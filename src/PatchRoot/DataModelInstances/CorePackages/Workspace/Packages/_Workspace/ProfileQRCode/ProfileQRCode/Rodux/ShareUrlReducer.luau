local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
return require(l_script_FirstAncestor_0.Parent.Rodux).createReducer({}, {
    [require(l_script_FirstAncestor_0.Networking.createOrGetProfileShareUrl).Succeeded.name] = function(_, v2)
        return v2.responseBody;
    end
});
