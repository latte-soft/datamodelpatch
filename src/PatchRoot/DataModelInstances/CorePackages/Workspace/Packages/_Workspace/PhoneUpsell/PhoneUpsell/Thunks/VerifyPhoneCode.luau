local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local v2 = require(l_script_FirstAncestor_0.Parent.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.PostVerifyPhoneCode);
return function(v4, v5)
    return function()
        return v3(v4, v5):andThen(function(_)
            return v2.resolve();
        end, function(v7)
            local v8 = 0;
            if v7.Body then
                v8 = l_HttpService_0:JSONDecode(v7.Body).errors[1].code;
            end;
            return v2.reject({
                ErrorCode = v8
            });
        end);
    end;
end;
