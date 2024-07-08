local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagDeprecatedSocialLibrariesCells);
local v3 = require(l_script_FirstAncestor_0.Conversation.getConversationDisplayTitle);
local l_Roact_0 = v1.Roact;
local v5 = require(script.Parent.PresenceBubbleCellStyled);
local v6 = require(script:FindFirstAncestor("Components").Style.TestStyle);
local v7 = l_Roact_0.PureComponent:extend("ConversationCell");
v7.defaultProps = {
    boldTitle = true, 
    subTitleText = nil, 
    secondaryTitleText = nil, 
    conversation = {}, 
    childWidth = 0, 
    onActivated = nil, 
    onCircleActivated = nil, 
    isLoading = false, 
    style = v6, 
    Size = UDim2.new(1, 0, 1, 0)
};
v7.init = function(v8)
    assert(not v2(), "social-libraries Cells are deprecated, please use Cell components from app-chat rotriever package");
    v8.onActivated = function()
        if v8.props.onActivated then
            v8.props.onActivated(v8.props.conversation);
        end;
    end;
end;
v7.render = function(v9)
    local l_conversation_0 = v9.props.conversation;
    local v11 = v3(l_conversation_0);
    local v12 = not not v9.props.subTitleText and v9.props.subTitleText:split("\n") or nil;
    return l_Roact_0.createElement(v5, {
        boldTitle = v9.props.boldTitle, 
        style = v9.props.style, 
        childWidth = v9.props.childWidth, 
        onActivated = v9.onActivated, 
        onCircleActivated = v9.props.onCircleActivated, 
        subTitleText = not not v12 and v12[1] or "", 
        secondaryTitleText = v9.props.secondaryTitleText, 
        Size = v9.props.Size, 
        isLoading = v9.props.isLoading, 
        avatarCirclePresenceImage = l_conversation_0.presenceImage, 
        titleText = v11, 
        thumbnails = l_conversation_0.thumbnails
    }, v9.props[l_Roact_0.Children]);
end;
return v7;
