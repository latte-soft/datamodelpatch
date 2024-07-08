local function _()
    return game:GetEngineFeature("ReportAnythingScreenshot") and game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal");
end;
local v1 = {};
v1.__index = v1;
local v2 = {};
local v3 = {};
local v4 = false;
local v5 = {
    RAABTestReason = "RAABTest"
};
local function v13(v6)
    v6.ScreenshotUploaded:Connect(function(v7, v8)
        local v9 = v2[v7];
        if v9 then
            v9(v8);
            table.remove(v2, v7);
            return ;
        else
            return ;
        end;
    end);
    v6.ScreenshotContentReady:Connect(function(v10, v11)
        local v12 = v3[v10];
        if v12 then
            v12(v11);
            table.remove(v3, v10);
            return ;
        else
            return ;
        end;
    end);
    v4 = true;
end;
v1.TakeScreenshotWithCallback = function(_, v15, v16)
    if game:GetEngineFeature("ReportAnythingScreenshot") and game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal") then
        local l_SafetyService_0 = game:GetService("SafetyService");
        local v18 = l_SafetyService_0:TakeScreenshot({
            registerContent = v16 ~= nil and 1 or 0, 
            reason = v5.RAABTestReason
        });
        v2[v18] = v15;
        v3[v18] = v16;
        if not v4 then
            v13(l_SafetyService_0);
        end;
        return true;
    else
        return false;
    end;
end;
return v1;
