local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local v2 = require(l_script_FirstAncestor_0.Parent.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.PostResendPhoneCode);
return function(v4)
    return function()
        return v3(v4):andThen(function(_)
            return v2.resolve();
        end, function(v6)
            local v7 = 0;
            if v6.Body then
                v7 = l_HttpService_0:JSONDecode(v6.Body).errors[1].code;
            end;
            return v2.reject({
                ErrorCode = v7
            });
        end);
    end;
end;
