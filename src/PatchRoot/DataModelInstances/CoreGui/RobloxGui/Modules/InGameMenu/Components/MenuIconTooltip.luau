local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = require(l_Parent_0.Actions.SetMenuIconTooltipOpen);
local v9 = require(l_Parent_0.Parent.TopBar.Constants);
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local v11 = Vector2.new(v9.ScreenSideOffset, v9.TopBarHeight - 32);
local v12 = l_Roact_0.PureComponent:extend("MenuIconTooltip");
v12.validateProps = l_t_0.strictInterface({
    isTooltipOpen = l_t_0.boolean, 
    onDismiss = l_t_0.callback
});
v12.render = function(v13)
    return v7({
        bodyText = "CoreScripts.InGameMenu.EducationalPopup.MenuIconTooltip"
    })(function(v14)
        return v13.props.isTooltipOpen and l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            TooltipScreenGui = l_Roact_0.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Tooltip = l_Roact_0.createElement(l_Tooltip_0, {
                    triggerPosition = v11, 
                    triggerSize = Vector2.new(32, 32), 
                    bodyText = v14.bodyText, 
                    onDismiss = v13.props.onDismiss, 
                    forceClickTriggerPoint = true
                })
            })
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v15, _)
    return {
        isTooltipOpen = v15.nativeClosePrompt.menuIconTooltipOpen
    };
end, function(v17)
    return {
        onDismiss = function()
            v17(v8(false));
        end
    };
end)(v12);
