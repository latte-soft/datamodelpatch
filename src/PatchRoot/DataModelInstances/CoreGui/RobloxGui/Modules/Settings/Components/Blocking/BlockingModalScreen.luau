local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local v6 = require(script.Parent.BlockingModalContainer);
local v7 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagWrapBlockModalScreenInProvider);
local v10 = v3.PureComponent:extend("BlockingModalScreen");
v10.validateProps = v4.interface({
    closeModal = v4.callback, 
    player = v4.interface({
        DisplayName = v4.string, 
        Name = v4.string, 
        UserId = v4.number
    }), 
    translator = v4.optional(v4.table), 
    source = v4.optional(v4.string)
});
v10.render = function(v11)
    local v12 = v3.createElement(v6, v11.props);
    if v9() then
        v12 = v3.createElement(v5, {
            selectionGroupName = "BlockingModalScreen" .. tostring(v11.props.player.UserId), 
            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            BlockingModalContainerWrapper = v12
        });
    end;
    return v7({
        v3.createElement(v3.Portal, {
            target = l_CoreGui_0
        }, {
            BlockingModalScreen = v3.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                AutoLocalize = false, 
                DisplayOrder = 6
            }, {
                BlockingModalContainer = v12
            })
        })
    });
end;
return v10;
