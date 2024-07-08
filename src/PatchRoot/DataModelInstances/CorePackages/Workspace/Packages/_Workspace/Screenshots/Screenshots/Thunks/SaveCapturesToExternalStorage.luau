local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Enums.ShotsToastType);
local v3 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
return function(v5)
    local v6 = {};
    for _, v8 in v5, nil, nil do
        table.insert(v6, v8.filePath);
    end;
    return function(v9)
        if not game:GetEngineFeature("CaptureServiceBulkManagementFeatureEnabled") then
            for _, v11 in v6, nil, nil do
                l_CaptureService_0:SaveCaptureToExternalStorage(v11);
            end;
        else
            l_CaptureService_0:SaveCapturesToExternalStorageAsync(v6);
        end;
        v9:dispatch(v3(v2.CaptureSavedToDevice));
    end;
end;
