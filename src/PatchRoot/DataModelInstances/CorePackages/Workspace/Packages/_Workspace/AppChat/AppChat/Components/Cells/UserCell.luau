local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.PresenceBubbleCellStyled);
local v6 = require(script.Parent.ExpandedUserCellStyled);
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v9 = {
    subTitleText = "subTitleText", 
    user = {}, 
    childWidth = 0, 
    style = l_TestStyle_0, 
    shouldUseExpandedCell = false, 
    showDivider = true, 
    boldTitle = true
};
return v2.memo(function(v10)
    local v11 = v4.Dictionary.join(v9, v10);
    local v12 = v2.useCallback(function()
        if v11.onActivated then
            v11.onActivated(v11.user);
        end;
    end);
    local l_user_0 = v11.user;
    local v14 = ((v8() and v11.shouldUseExpandedCell) and l_user_0.metadata) and l_user_0.metadata.isPending;
    return v2.createElement(if not not v8() and v11.shouldUseExpandedCell then v6 else v5, {
        style = v11.style, 
        childWidth = v11.childWidth, 
        onActivated = v12, 
        onCircleActivated = v11.onCircleActivated, 
        subTitleText = v11.subTitleText, 
        showDivider = v11.showDivider, 
        boldTitle = v11.boldTitle, 
        avatarCirclePresenceImage = l_user_0.presenceImage, 
        titleText = l_user_0.displayName, 
        secondaryTitleText = l_user_0.alias, 
        thumbnails = {
            l_user_0.thumbnail
        }, 
        pillText = if not v14 then nil else "Pending", 
        muteTitleColor = v14
    }, v11.children or {});
end);
