local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_withTooltip_0 = v6.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_withStyle_0 = v6.Core.Style.withStyle;
local l_Images_0 = v6.App.ImageSet.Images;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v13 = require(script.Parent.IconButton);
local l_Parent_0 = script.Parent.Parent.Parent;
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v17 = require(l_Parent_0.Actions.SetKeepOutArea);
local v18 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v19 = require(script.Parent.Parent.Parent.Parent.Chrome.Enabled);
local v20 = require(l_RobloxGui_0.Modules.Settings.BackButtonController);
local v21 = require(l_RobloxGui_0.Modules.Flags.GetFStringTeleportBackButtonTopBarIXPCustomFieldName);
local v22 = v3.PureComponent:extend("BackIcon");
local v23 = not v19() and 32 or v15.TopBarButtonHeight;
v22.validateProps = v5.strictInterface({
    layoutOrder = v5.integer, 
    topBarEnabled = v5.boolean, 
    backEnabled = v5.boolean, 
    setKeepOutArea = v5.callback, 
    removeKeepOutArea = v5.callback
});
v22.init = function(v24)
    v24.rootRef = v3.createRef();
    v24.backIconActivated = function()
        v20.initiateBackButtonTeleport(Enum.AdTeleportMethod.UIBackButton);
    end;
    v24:setState({
        tooltipActive = false, 
        respondToHover = false, 
        text = nil
    });
end;
v22.didMount = function(v25)
    task.spawn(function()
        v25:setState({
            text = v20.getTooltipTextTimeout(), 
            tooltipActive = true
        });
        task.delay(5, function()
            v25:setState({
                tooltipActive = false, 
                respondToHover = true
            });
        end);
    end);
end;
v22.render = function(v26)
    local v27 = (((v26.props.topBarEnabled and v26.props.backEnabled) and not v12:IsEnabled()) and not l_VRService_0.VREnabled) and v26.state.text ~= nil;
    local v28 = {
        bodyText = v26.state.text
    };
    local v29 = {
        preferredOrientation = l_TooltipOrientation_0.Bottom, 
        guiTarget = l_CoreGui_0, 
        triggerPointName = "TriggerPoint", 
        active = v26.state.tooltipActive and v27, 
        DisplayOrder = -1
    };
    local function _(v30)
        if not v27 or not v30 then
            v26.props.removeKeepOutArea(v15.BackIconKeepOutAreaId);
            return ;
        else
            v26.props.setKeepOutArea(v15.BackIconKeepOutAreaId, v30.AbsolutePosition, v30.AbsoluteSize);
            return ;
        end;
    end;
    if not (not v16 or not v26.rootRef.current) then
        local l_current_0 = v26.rootRef.current;
        if not v27 or not l_current_0 then
            v26.props.removeKeepOutArea(v15.BackIconKeepOutAreaId);
        else
            v26.props.setKeepOutArea(v15.BackIconKeepOutAreaId, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
        end;
    end;
    return l_withTooltip_0(v28, v29, function(v33)
        local function v35(v34)
            if not v27 or not v34 then
                v26.props.removeKeepOutArea(v15.BackIconKeepOutAreaId);
            else
                v26.props.setKeepOutArea(v15.BackIconKeepOutAreaId, v34.AbsolutePosition, v34.AbsoluteSize);
            end;
            v33(v34);
        end;
        return l_withStyle_0(function(_)
            return v3.createElement("TextButton", {
                Text = "", 
                Visible = v27, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v23, 1, 0), 
                LayoutOrder = v26.props.layoutOrder, 
                Selectable = false, 
                [v3.Change.AbsoluteSize] = if not v16 then v33 else v35, 
                [v3.Change.AbsolutePosition] = if not v16 then v33 else v35, 
                [v3.Ref] = v26.rootRef
            }, {
                Background = v3.createElement(v13, {
                    icon = l_Images_0["icons/actions/cycleLeft"], 
                    iconSize = 20, 
                    onHover = function()
                        if v26.state.respondToHover then
                            v26:setState({
                                tooltipActive = true, 
                                text = v20.getTooltipText()
                            });
                        end;
                    end, 
                    onHoverEnd = function()
                        if v26.state.respondToHover then
                            v26:setState({
                                tooltipActive = false
                            });
                        end;
                    end, 
                    onActivated = v26.backIconActivated
                })
            });
        end);
    end);
end;
return (v20.connectExperimentUserLayer(v4.connect(function(v37)
    return {
        topBarEnabled = v37.displayOptions.topbarEnabled
    };
end, function(v38)
    return {
        setKeepOutArea = function(v39, v40, v41)
            return v38(v17(v39, v40, v41));
        end, 
        removeKeepOutArea = function(v42)
            return v38(v18(v42));
        end
    };
end)(v22), "backEnabled", v21()));
