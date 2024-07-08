local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactAppExperiment);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_0.Utils.createShutterSound);
local v8 = require(l_Parent_0.Analytics.EventNames);
local v9 = require(l_Parent_0.Utils.getCaptureShortcutSetupKeys);
local v10 = require(l_Parent_0.Thunks.TakeCapture);
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useRef_0 = v4.useRef;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useUserExperiment_0 = v5.useUserExperiment;
local l_FStringCapturesIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringCapturesIXPLayer;
local v18 = require(l_Parent_0.Flags.FFlagEnableCapturesHotkeyExperiment);
local v19 = if not v18 then game:DefineFastString("CapturesIXPLayer", "Experience.Menu") else l_FStringCapturesIXPLayer_0;
local _ = function()
    for _, v21 in (v9()), nil, nil do
        if l_UserInputService_0:IsKeyDown(v21) then
            return true;
        end;
    end;
    return false;
end;
return function()
    if v18 then
        local v23 = v11();
        local v24 = l_useDispatch_0();
        local v26 = l_useSelector_0(function(v25)
            return v25.Screenshots.IsCapturesCoreGuiEnabled;
        end);
        local v27 = l_useRef_0(v7());
        local v29 = l_useUserExperiment_0({
            v19
        }, function(v28)
            return (v28[v19] or {}).CapturesDesktopHotkeyEnabled;
        end);
        l_useEffect_0(function()
            if v29 then
                if v26 then
                    if not v27.current then
                        v27.current = v7();
                    end;
                    local function _()
                        if v27.current then
                            v27.current:Play();
                        end;
                        v23.fireEvent(v8.CapturesEntrypointActivated);
                        v23.fireEvent(v8.CapturesDesktopHotkeyCaptureTriggered);
                        v24(v10());
                    end;
                    l_ContextActionService_0:BindCoreAction("CaptureShortcutAction", function(_, v32)
                        if v32 == Enum.UserInputState.Begin then
                            local v33;
                            for _, v35 in (v9()), nil, nil do
                                if l_UserInputService_0:IsKeyDown(v35) then
                                    v33 = true;
                                    goto label0 --[[  true, false  ]];
                                end;
                            end;
                            v33 = false;
                            ::label0::;
                            if v33 then
                                if v27.current then
                                    v27.current:Play();
                                end;
                                v23.fireEvent(v8.CapturesEntrypointActivated);
                                v23.fireEvent(v8.CapturesDesktopHotkeyCaptureTriggered);
                                v24(v10());
                                return Enum.ContextActionResult.Sink;
                            end;
                        end;
                        return Enum.ContextActionResult.Pass;
                    end, false, Enum.KeyCode.One);
                    return function()
                        if v27.current then
                            v27.current:Stop();
                            v27.current:Destroy();
                            v27.current = nil;
                        end;
                        l_ContextActionService_0:UnbindCoreAction("CaptureShortcutAction");
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end, {
            v24, 
            v26, 
            v29
        });
        return ;
    else
        return ;
    end;
end;
