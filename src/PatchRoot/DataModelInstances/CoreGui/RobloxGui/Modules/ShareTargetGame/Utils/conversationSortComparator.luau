local l_getConversationDisplayTitle_0 = require(script:FindFirstAncestor("ShareTargetGame").dependencies).SocialLibraries.Conversation.getConversationDisplayTitle;
return function(v1, v2)
    assert(type(v1 == "table"), "ConversationA should be a table value. Value given: ", (type(v1)));
    assert(v1.title or v1.titleForViewer, "ConversationA should have a title string");
    assert(type(v2 == "table"), "ConversationB should be a table value. Value given: ", (type(v2)));
    assert(v2.title or v2.titleForViewer, "ConversationB should have a title string");
    if v1.lastUpdated ~= nil and v2.lastUpdated ~= nil then
        return v2.lastUpdated < v1.lastUpdated;
    elseif v1.lastUpdated ~= nil then
        return true;
    elseif v2.lastUpdated ~= nil then
        return false;
    else
        return l_getConversationDisplayTitle_0(v1) < l_getConversationDisplayTitle_0(v2);
    end;
end;
