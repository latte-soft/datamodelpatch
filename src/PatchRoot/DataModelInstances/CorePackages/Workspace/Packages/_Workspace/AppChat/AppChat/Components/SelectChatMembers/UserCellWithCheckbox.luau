local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Roact);
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = if not v2.Flags.getFFlagDeprecatedSocialLibrariesCells() then v2.Components.Cells.UserCell else require(l_script_FirstAncestor_0.Components.Cells.UserCell);
local v4 = require(script.Parent.Checkbox);
return function(v5)
    return v1.createElement(v3, {
        style = v5.style, 
        user = v5.user, 
        subTitleText = v5.subTitleText, 
        secondaryTitleText = v5.secondaryTitleText, 
        isCheckboxActivated = v5.isCheckboxActivated, 
        onActivated = v5.onActivated, 
        childWidth = 64
    }, {
        checkbox = v1.createElement(v4, {
            activated = v5.isCheckboxActivated
        })
    });
end;
