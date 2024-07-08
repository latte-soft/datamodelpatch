local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.PostSetPhone);
local l_isStringPhone_0 = require(l_Parent_0.AuthCommon).Utils.isStringPhone;
return function(v6, v7, v8, v9, v10)
    return function()
        if l_isStringPhone_0(v8 .. v9) then
            return v4(v6, v7, v8, v9, v10):andThen(function(_)
                return v3.resolve();
            end, function(v12)
                local v13 = 0;
                if v12.Body then
                    v13 = l_HttpService_0:JSONDecode(v12.Body).errors[1].code;
                end;
                return v3.reject({
                    ErrorCode = v13, 
                    PhoneRegexFailed = false
                });
            end);
        else
            return v3.reject({
                PhoneRegexFailed = true
            });
        end;
    end;
end;
