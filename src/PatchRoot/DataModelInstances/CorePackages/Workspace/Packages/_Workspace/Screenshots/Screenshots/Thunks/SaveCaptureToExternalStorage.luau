local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Services.CaptureService);
local v2 = require(l_Parent_0.Experimentation.getIsFeatureVisibleToDesktopUser);
local v3 = require(l_Parent_0.Enums.ShotsToastType);
local v4 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
local v6 = require(l_Parent_0.Flags.FFlagDecomposeDesktopCapturesEligibilityCheck);
return function(v7)
    return function(v8)
        v1:SaveCaptureToExternalStorage(v7.filePath);
        if not v2() or v6 then
            v8:dispatch(v4(v3.CaptureSavedToDevice));
            return ;
        else
            v8:dispatch(v4(v3.CaptureSavedToDeviceWithOpenCTA));
            return ;
        end;
    end;
end;
