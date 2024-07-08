local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v1 = require(script.Parent.Parent.Analytics);
return function(v2)
    local l_status_0, l_result_0 = pcall(function()
        return l_UGCValidationService_0:CanLoadAsset(v2);
    end);
    if l_status_0 and l_result_0 then
        return true;
    else
        v1.reportFailure(v1.ErrorType.validateCanLoad);
        return false, {
            "Asset could not be loaded"
        };
    end;
end;
