local l_HttpService_0 = game:GetService("HttpService");
return function(v1)
    if (not (v1 ~= nil and v1.errors ~= nil) or not v1.errors[1]) or not v1.errors[1].fieldData then
        return "", "";
    else
        local l_fieldData_0 = v1.errors[1].fieldData;
        local l_status_0, l_result_0 = pcall(function()
            return l_HttpService_0:JSONDecode(l_fieldData_0);
        end);
        if not l_status_0 then
            return "", l_fieldData_0;
        else
            local v5 = "";
            local v6 = "";
            if l_result_0.unifiedCaptchaId then
                v5 = l_result_0.unifiedCaptchaId;
            end;
            if l_result_0.dxBlob then
                v6 = l_result_0.dxBlob;
            end;
            return v5, v6;
        end;
    end;
end;
