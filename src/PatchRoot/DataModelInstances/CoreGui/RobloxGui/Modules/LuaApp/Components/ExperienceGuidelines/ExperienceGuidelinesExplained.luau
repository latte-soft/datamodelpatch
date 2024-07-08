local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v6 = require(script.Parent.ExperienceGuidelinesExplainedFull);
local v7 = require(script.Parent.ExperienceGuidelinesExplainedModal);
local v8 = v3.PureComponent:extend("ExperienceGuidelinesExplained");
v8.validateProps = v2.strictInterface({
    formFactor = v2.string, 
    universeId = v2.string, 
    containerWidth = v2.optional(v2.integer), 
    focusController = v2.optional(v2.table), 
    defaultChildRef = v2.optional(v2.table), 
    hideCloseButton = v2.optional(v2.boolean), 
    closeCentralOverlayThunk = v2.optional(v2.callback)
});
v8.render = function(v9)
    if v9.props.formFactor == l_FormFactor_0.WIDE then
        return v3.createElement(v7, {
            universeId = v9.props.universeId, 
            hideCloseButton = v9.props.hideCloseButton
        });
    else
        return v3.createElement(v6, {
            universeId = v9.props.universeId
        });
    end;
end;
return (v4.connect(function(v10, _)
    return {
        formFactor = v10.FormFactor
    };
end)(v8));
