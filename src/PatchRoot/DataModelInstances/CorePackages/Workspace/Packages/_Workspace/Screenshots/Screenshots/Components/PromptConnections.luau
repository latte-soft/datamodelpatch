local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useExternalEvent_0 = v5.Core.Hooks.useExternalEvent;
local v8 = require(l_Parent_0.Actions.PromptTriggered);
local v9 = require(l_Parent_0.Enums.PromptType);
local v10 = require(l_Parent_0.App.ScreenshotsPolicy);
local _ = require(l_Parent_0.Types);
return (v10.connect(function(v12)
    return {
        enableShareCaptureCTA = v12.enableShareCaptureCTA()
    };
end)(function(v13)
    local v14 = l_useDispatch_0();
    l_useExternalEvent_0(l_CaptureService_0.OpenSaveCapturesPrompt, (v3.useCallback(function(v15, v16)
        v14(v8(v15, v9.SaveCaptures, {
            contentIds = v16
        }));
    end, {})));
    l_useExternalEvent_0(l_CaptureService_0.OpenShareCapturePrompt, (v3.useCallback(function(v17, v18, v19)
        local v20 = {
            contentId = v18, 
            launchData = v19
        };
        if not v13.enableShareCaptureCTA then
            l_CaptureService_0:OnSharePromptFinished(v17, false);
            return ;
        else
            v14(v8(v17, v9.ShareCapture, v20));
            return ;
        end;
    end, {
        v13.enableShareCaptureCTA
    })));
    return v3.createElement(v3.Fragment, {}, {});
end));
