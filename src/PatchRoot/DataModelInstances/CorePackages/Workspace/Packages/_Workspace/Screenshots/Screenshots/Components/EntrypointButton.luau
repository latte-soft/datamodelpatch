local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_useExternalEvent_0 = v5.Core.Hooks.useExternalEvent;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v10 = require(l_Parent_0.Utils.createShutterSound);
local v11 = require(l_Parent_0.Analytics.EventNames);
local v12 = require(l_Parent_0.Context.ShotsContext);
local v13 = require(l_Parent_0.Thunks.TakeCapture);
local v14 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v20 = require(l_Parent_0.Flags.FFlagMakeEntrypointButtonDraggable);
local l_GetFFlagEnableScreenshotUtility_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableScreenshotUtility;
return function(_)
    local v23 = v14();
    local v24 = l_useDispatch_0();
    local v25 = l_useStyle_0();
    local v27 = l_useSelector_0(function(v26)
        return v26.Screenshots.IsActive;
    end);
    local v28 = l_GetFFlagEnableScreenshotUtility_0() and v3.useContext(v12).chromeEnabled;
    local v29 = l_useRef_0(nil);
    local v30 = l_useRef_0(nil);
    local v31 = l_useRef_0(false);
    local v32 = l_useRef_0(v10());
    local v33 = l_useRef_0(nil);
    local v34 = l_useCallback_0(function()
        if not v33.current then
            v33.current = DateTime.now().UnixTimestampMillis;
        end;
    end, {});
    local v35 = l_useCallback_0(function()
        v23.fireEvent(v11.CapturesEntrypointActivated);
        if v32.current then
            v32.current:Play();
        end;
        v24(v13());
    end, {});
    if v20 then
        l_useExternalEvent_0(l_UserInputService_0.TouchMoved, function(v36, _)
            if not (v29.current or not v33.current) and DateTime.now().UnixTimestampMillis - v33.current >= 100 then
                v31.current = true;
                v29.current = v36;
            end;
            if not ((not (v36 == v29.current) or not v31.current) or not v30.current) then
                v30.current.Position = UDim2.fromOffset(v36.Position.X + 24, v36.Position.Y + 24);
            end;
        end);
        l_useExternalEvent_0(l_UserInputService_0.TouchEnded, function(v38, _)
            if not v33.current or not v31.current then
                if v33.current then
                    v35();
                end;
            else
                v23.fireEvent(v11.CapturesEntrypointDragged);
            end;
            if v38 == v29.current then
                v29.current = nil;
            end;
            v31.current = false;
            v33.current = nil;
        end);
    end;
    l_useEffect_0(function()
        if v27 then
            v23.fireEvent(v11.CapturesEntrypointViewed);
        end;
        if not v32.current then
            v32.current = v10();
        end;
        return function()
            if v32.current then
                v32.current:Stop();
                v32.current:Destroy();
                v32.current = nil;
            end;
        end;
    end, {
        v27
    });
    return v3.createElement("Frame", {
        Active = false, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(1, -50, 0.5, 0), 
        Size = UDim2.fromOffset(48, 48), 
        Visible = v27 and not v28, 
        ref = if not v20 then nil else v30
    }, {
        CameraButton = v3.createElement("ImageButton", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = v25.Theme.Overlay.Transparency * v25.Theme.Overlay.Transparency, 
            BackgroundColor3 = v25.Theme.Overlay.Color, 
            [v3.Event.Activated] = if v20 then nil else v35, 
            [v3.Event.InputBegan] = if not v20 then nil else v34
        }, {
            Border = v3.createElement("UIStroke", {
                Color = v25.Theme.Overlay.Color, 
                Transparency = v25.Theme.Overlay.Transparency, 
                Thickness = 2
            }), 
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            CameraIcon = v3.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(36, 36), 
                Image = l_Images_0["icons/controls/screenshot"]
            })
        })
    });
end;
