local v0 = require(script.Parent.Parent.Parent.Rodux);
return function(v1)
    return v0.createReducer(false, {
        [v1.networkingAccountInformation.GetPhoneInformation.Succeeded.name] = function(_, v3)
            return v3.responseBody and v3.responseBody.isVerified;
        end
    });
end;
