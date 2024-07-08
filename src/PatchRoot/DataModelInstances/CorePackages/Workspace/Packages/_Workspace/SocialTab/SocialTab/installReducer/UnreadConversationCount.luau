local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
return require(l_script_FirstAncestor_0.dependencies).Rodux.createReducer(0, {
    [require(l_script_FirstAncestor_0.Requests.GetUnreadConversationCount).Succeeded.name] = function(v1, v2)
        if not v2.responseBody or not v2.responseBody.count then
            return v1;
        else
            return v2.responseBody.count;
        end;
    end, 
    [require(l_script_FirstAncestor_0.Parent.AppChatNetworking).rodux.GetConversationMetadata.Succeeded.name] = function(v3, v4)
        if not v4.responseBody or not v4.responseBody.global_unread_message_count then
            return v3;
        else
            return v4.responseBody.global_unread_message_count;
        end;
    end
});
