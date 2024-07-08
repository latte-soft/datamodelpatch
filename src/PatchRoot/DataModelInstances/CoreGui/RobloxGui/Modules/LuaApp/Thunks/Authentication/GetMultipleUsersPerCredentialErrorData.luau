local l_HttpService_0 = game:GetService("HttpService");
return function(v1)
    if not ((not (v1 ~= nil and v1.errors ~= nil) or not v1.errors[1]) or not v1.errors[1].fieldData) then
        local l_fieldData_0 = v1.errors[1].fieldData;
        local l_status_0, l_result_0 = pcall(function()
            return l_HttpService_0:JSONDecode(l_fieldData_0);
        end);
        if l_status_0 then
            return l_result_0.users or {};
        end;
    end;
    return {};
end;
