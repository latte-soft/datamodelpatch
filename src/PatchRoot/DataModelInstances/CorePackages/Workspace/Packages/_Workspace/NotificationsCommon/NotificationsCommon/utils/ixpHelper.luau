local l_IXPService_0 = game:GetService("IXPService");
return {
    getIxpLayerData = function(v1)
        local l_status_0, l_result_0 = pcall(function()
            return l_IXPService_0:GetUserLayerVariables(v1);
        end);
        return not not l_status_0 and l_result_0 or nil;
    end, 
    logUserLayerExposure = function(v4)
        pcall(function()
            l_IXPService_0:LogUserLayerExposure(v4);
        end);
    end
};
