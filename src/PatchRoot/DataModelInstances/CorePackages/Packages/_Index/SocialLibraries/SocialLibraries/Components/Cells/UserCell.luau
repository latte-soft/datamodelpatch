local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagDeprecatedSocialLibrariesCells);
local l_Roact_0 = v1.Roact;
local v4 = require(script.Parent.PresenceBubbleCellStyled);
local v5 = require(script:FindFirstAncestor("Components").Style.TestStyle);
local v6 = l_Roact_0.PureComponent:extend("UserCell");
v6.defaultProps = {
    subTitleText = "subTitleText", 
    secondaryTitleText = nil, 
    user = {}, 
    childWidth = 0, 
    onActivated = nil, 
    onCircleActivated = nil, 
    style = v5, 
    showDivider = true, 
    boldTitle = true
};
v6.init = function(v7)
    assert(not v2(), "social-libraries Cells are deprecated, please use Cell components from app-chat rotriever package");
    v7.onActivated = function()
        if v7.props.onActivated then
            v7.props.onActivated(v7.props.user);
        end;
    end;
end;
v6.render = function(v8)
    local l_user_0 = v8.props.user;
    return l_Roact_0.createElement(v4, {
        style = v8.props.style, 
        childWidth = v8.props.childWidth, 
        onActivated = v8.onActivated, 
        onCircleActivated = v8.props.onCircleActivated, 
        subTitleText = v8.props.subTitleText, 
        showDivider = v8.props.showDivider, 
        boldTitle = v8.props.boldTitle, 
        avatarCirclePresenceImage = l_user_0.presenceImage, 
        titleText = l_user_0.displayName, 
        secondaryTitleText = l_user_0.alias, 
        thumbnails = {
            l_user_0.thumbnail
        }
    }, v8.props[l_Roact_0.Children]);
end;
return v6;
