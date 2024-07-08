local l_Parent_0 = script.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.dependencies).Promise;
local v2 = require(l_Parent_0.Requests.PostValidateCode);
local _ = require(l_Parent_0.Common.otpLoginTypes);
return function(v4, v5)
    return function()
        return v2(v4, v5):andThen(function(v6)
            return l_Promise_0.resolve(v6.responseBody);
        end):catch(function(v7)
            if not v7.data then
                if not v7.StatusCode then
                    return l_Promise_0.reject();
                else
                    return l_Promise_0.reject(v7.StatusCode);
                end;
            else
                return l_Promise_0.reject(v7.data.errorCode);
            end;
        end);
    end;
end;
