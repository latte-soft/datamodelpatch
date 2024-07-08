local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_1.ApolloClient);
local l_gql_0 = v5.gql;
local l_useQuery_0 = v5.useQuery;
local v8 = require(l_script_FirstAncestor_0.Config);
local v9 = require(l_script_FirstAncestor_0.context);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceIncludesColon");
local v11 = require(l_script_FirstAncestor_0.Flags.isExperienceChatUserProfileApiEnabled);
appendVerifiedBadge = function(v12)
    if not l_game_EngineFeature_0 then
        return v12 .. v8.VERIFIED_EMOJI;
    else
        return string.gsub(v12, ":(%S-)$", v8.VERIFIED_EMOJI .. ":%1");
    end;
end;
local function v14(v13)
    if not v9.apolloClient then
        return nil;
    else
        return (l_useQuery_0(l_gql_0("\t\t\tquery UserProfiles($userIds: [String] $userIds) {\n\t\t\t\t\tid\n\t\t\t\t\tnames {\n\t\t\t\t\t\tcombinedName\n\t\t\t\t\t\tusername\n\t\t\t\t\t\talias\n\t\t\t\t\t\tdisplayName\n\t\t\t\t\t\tcontactName\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t"), {
            errorPolicy = "all", 
            variables = {
                userIds = {
                    (tostring(v13.userId))
                }
            }, 
            client = v9.apolloClient
        }));
    end;
end;
trim = function(v15)
    if not v15:match("^()%s*$") then
        return (v15:match("^%s*(.*%S)"));
    else
        return "";
    end;
end;
getMessageText = function(v16, v17, v18)
    if not (v17 ~= nil) or v17 == "" then
        return v18 or "";
    elseif not v16 then
        return v18 or "";
    else
        return v17 or "";
    end;
end;
return (v4.connect(function()
end, function(v19)
    return {
        onToggle = function(v20, v21)
            v19({
                type = "ChatTranslationMessageToggled", 
                useTranslation = v20, 
                messageId = v21
            });
        end
    };
end)(function(v22)
    local v23, v24 = v3.useState(nil);
    local l_showTranslationButton_0 = v22.showTranslationButton;
    if l_showTranslationButton_0 then
        l_showTranslationButton_0 = false;
        if v22.message.translation ~= nil then
            l_showTranslationButton_0 = v22.message.translation ~= "";
        end;
    end;
    local v26 = getMessageText(v22.message.useTranslation, v22.message.translation, v22.message.text);
    local v27 = v22.message.prefixText or "";
    local v28 = v23 or v27;
    local l_chatWindowSettings_0 = v22.chatWindowSettings;
    local v30 = if not not v11() and v22.message.userId then v14(v22.message) else nil;
    v3.useEffect(function()
        if not (not v30 or not v30.data) then
            local l_names_0 = v30.data.userProfiles[1].names;
            v24((string.gsub(v28, l_names_0.displayName, l_names_0.combinedName)));
        end;
    end, {
        v22.message.userId, 
        if not v30 then nil else v30.data
    });
    if v22.isUserVerified then
        v28 = appendVerifiedBadge(v28);
    end;
    v28 = if not l_game_EngineFeature_0 then v28 .. ": " else v28 .. " ";
    local v32 = l_chatWindowSettings_0.TextSize - 2;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        TextLabel = v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = v22.LayoutOrder
        }, {
            TextMessage = v3.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                FontFace = l_chatWindowSettings_0.FontFace, 
                RichText = true, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = if not l_showTranslationButton_0 then if string.len(v27) == 0 then v26 else v28 .. v26 else if string.len(v27) == 0 then v26 else v28 .. "   " .. v26, 
                TextColor3 = l_chatWindowSettings_0.TextColor3, 
                TextSize = l_chatWindowSettings_0.TextSize, 
                TextStrokeColor3 = l_chatWindowSettings_0.TextStrokeColor3, 
                TextStrokeTransparency = v22.textStrokeTransparency or 0.5, 
                TextTransparency = v22.textTransparency or 0, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }, {
                TextMessageButton = if string.len(v27) ~= 0 then v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    TextButton = v3.createElement("TextButton", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        FontFace = l_chatWindowSettings_0.FontFace, 
                        RichText = true, 
                        Size = UDim2.new(0, 0, 0, 0), 
                        Text = trim(v28), 
                        TextSize = l_chatWindowSettings_0.TextSize, 
                        TextStrokeTransparency = 1, 
                        TextTransparency = 1, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        LayoutOrder = 1, 
                        [v3.Event.Activated] = function()
                            v22.onTextMessageLabelButtonActivated(v22.message);
                        end
                    }), 
                    TranslationButton = if not l_showTranslationButton_0 then nil else v3.createElement("ImageButton", {
                        Size = UDim2.new(0, v32, 0, v32), 
                        Image = "rbxasset://textures/translateIcon.png", 
                        HoverImage = "rbxasset://textures/translateIconDark.png", 
                        PressedImage = "rbxasset://textures/translateIconDark.png", 
                        ImageTransparency = v22.textTransparency or 0, 
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        [v3.Event.Activated] = function()
                            v22.onToggle(not v22.message.useTranslation, v22.message.messageId);
                        end
                    })
                }) else nil
            })
        })
    });
end));
