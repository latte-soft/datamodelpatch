local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ApolloClient);
local l_gql_0 = v3.gql;
local l_useQuery_0 = v3.useQuery;
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.context);
local v8 = require(l_script_FirstAncestor_0.Flags.isExperienceChatUserProfileApiEnabled);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceIncludesColon");
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagFixDoubleSpacesAfterPrefixText);
appendVerifiedBadge = function(v11)
    if not l_game_EngineFeature_0 then
        return v11 .. v6.VERIFIED_EMOJI;
    else
        return string.gsub(v11, ":(%S-)$", v6.VERIFIED_EMOJI .. ":%1");
    end;
end;
local function v13(v12)
    if not v7.apolloClient then
        return nil;
    else
        return (l_useQuery_0(l_gql_0("\t\t\tquery UserProfiles($userIds: [String] $userIds) {\n\t\t\t\t\tid\n\t\t\t\t\tnames {\n\t\t\t\t\t\tcombinedName\n\t\t\t\t\t\tusername\n\t\t\t\t\t\talias\n\t\t\t\t\t\tdisplayName\n\t\t\t\t\t\tcontactName\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t"), {
            errorPolicy = "all", 
            variables = {
                userIds = {
                    (tostring(v12.userId))
                }
            }, 
            client = v7.apolloClient
        }));
    end;
end;
local function _(v14, v15)
    if not v10() then
        return v14;
    else
        if v15 then
            v14 = appendVerifiedBadge(v14);
        end;
        return v14 .. " ";
    end;
end;
return function(v17)
    local v18, v19 = v2.useState(nil);
    local v20 = v17.message.text or "";
    local v21 = v17.message.prefixText or "";
    local v22 = v18 or v21;
    local l_chatWindowSettings_0 = v17.chatWindowSettings;
    local v24 = if not not v8() and v17.message.userId then v13(v17.message) else nil;
    v2.useEffect(function()
        if not (not v24 or not v24.data) then
            local l_names_0 = v24.data.userProfiles[1].names;
            v19((string.gsub(v22, l_names_0.displayName, l_names_0.combinedName)));
        end;
    end, {
        v17.message.userId, 
        if not v24 then nil else v24.data
    });
    if not v10() then
        if v17.isUserVerified then
            v22 = appendVerifiedBadge(v22);
        end;
        v22 = if not l_game_EngineFeature_0 then v22 .. ": " else v22 .. " ";
    end;
    local l_createElement_0 = v2.createElement;
    local v27 = "TextLabel";
    local v28 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = l_chatWindowSettings_0.FontFace, 
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v29;
    if string.len(v21) == 0 then
        v29 = v20;
    else
        local l_v22_0 = v22;
        local l_isUserVerified_0 = v17.isUserVerified;
        local v32;
        if not v10() then
            v32 = l_v22_0;
        else
            if l_isUserVerified_0 then
                l_v22_0 = appendVerifiedBadge(l_v22_0);
            end;
            v32 = l_v22_0 .. " ";
        end;
        v29 = v32 .. v20;
    end;
    v28.Text = v29;
    v28.TextColor3 = l_chatWindowSettings_0.TextColor3;
    v28.TextSize = l_chatWindowSettings_0.TextSize;
    v28.TextStrokeColor3 = l_chatWindowSettings_0.TextStrokeColor3;
    v28.TextStrokeTransparency = v17.textStrokeTransparency or 0.5;
    v28.TextTransparency = v17.textTransparency or 0;
    v28.TextWrapped = true;
    v28.TextXAlignment = Enum.TextXAlignment.Left;
    v28.TextYAlignment = Enum.TextYAlignment.Top;
    v28.LayoutOrder = v17.LayoutOrder;
    return l_createElement_0(v27, v28, {
        TextMessageButton = if string.len(v21) ~= 0 then v2.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = l_chatWindowSettings_0.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = v22, 
            TextSize = v6.ChatWindowTextSize, 
            TextStrokeTransparency = 1, 
            TextTransparency = 1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            [v2.Event.Activated] = function()
                v17.onTextMessageLabelButtonActivated(v17.message);
            end
        }) else nil
    });
end;
