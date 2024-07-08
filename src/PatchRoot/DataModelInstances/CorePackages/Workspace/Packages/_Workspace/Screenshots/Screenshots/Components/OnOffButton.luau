local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local l_SegmentedControl_0 = require(l_Parent_1.UIBlox).App.Control.SegmentedControl;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v9 = require(l_Parent_0.Analytics.EventNames);
local v10 = require(l_Parent_0.Actions.ShotsActivated);
local v11 = require(l_Parent_0.Actions.ShotsDeactivated);
local v12 = require(l_Parent_0.Enums.ShotsToastType);
local v13 = require(l_Parent_0.Actions.ToastDismissed);
local v14 = require(l_Parent_0.Actions.ToastTriggered);
local v15 = require(l_Parent_0.Analytics.useAnalytics);
return function(v16)
    local v17 = v15();
    local v18 = l_useDispatch_0();
    local v20 = l_useSelector_0(function(v19)
        return v19.Screenshots.IsCapturesCoreGuiEnabled;
    end);
    local v22 = l_useSelector_0(function(v21)
        return v21.Screenshots.IsActive;
    end);
    local v23 = l_useLocalization_0({
        offText = "Feature.Captures.Control.Off", 
        onText = "Feature.Captures.Control.On"
    });
    return v3.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(v16.width, v16.height)
    }, {
        Control = v3.createElement(l_SegmentedControl_0, {
            height = v16.height, 
            onTabActivated = v3.useCallback(function(v24)
                if not (v24 == 1) or v22 then
                    if v22 then
                        v17.fireEvent(v9.CapturesDeactivatedInGameMenu);
                        v18(v11());
                        v18(v13());
                    end;
                    return ;
                else
                    v17.fireEvent(v9.CapturesActivatedInGameMenu);
                    v18(v10());
                    v18(v14(v12.ShotsActivated));
                    return ;
                end;
            end, {
                v22
            }), 
            selectedTabIndex = not v22 and 2 or 1, 
            tabs = {
                {
                    tabName = v23.onText, 
                    isDisabled = not v20
                }, 
                {
                    tabName = v23.offText, 
                    isDisabled = not v20
                }
            }, 
            width = UDim.new(0, v16.width)
        })
    });
end;
