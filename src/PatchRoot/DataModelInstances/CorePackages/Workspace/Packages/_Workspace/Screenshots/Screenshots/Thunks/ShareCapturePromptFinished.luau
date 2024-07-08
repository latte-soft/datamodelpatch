local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Actions.PromptDismissed);
local v3 = require(l_Parent_0.Thunks.ShareCapture);
local v4 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
return function(v6, v7, v8)
    return function(v9)
        v9:dispatch(v2(v6));
        if v8 then
            task.spawn(function()
                v9:dispatch(v3({
                    contentId = v7.contentId, 
                    filePath = l_CaptureService_0:GetCaptureFilePathAsync(v7.contentId), 
                    type = v4.Screenshot
                }, v7.launchData));
            end);
        end;
        l_CaptureService_0:OnSharePromptFinished(v6, v8);
    end;
end;
