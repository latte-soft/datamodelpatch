local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Thunks.RetrieveCaptures);
local _ = require(l_Parent_0.Types);
return function(v4)
    local v5 = {};
    for _, v7 in ipairs(v4) do
        table.insert(v5, v7.filePath);
    end;
    return function(v8)
        if not game:GetEngineFeature("CaptureServiceBulkManagementFeatureEnabled") then
            for _, v10 in ipairs(v5) do
                l_CaptureService_0:DeleteCapture(v10);
            end;
        else
            l_CaptureService_0:DeleteCapturesAsync(v5);
        end;
        v8:dispatch(v2());
    end;
end;
