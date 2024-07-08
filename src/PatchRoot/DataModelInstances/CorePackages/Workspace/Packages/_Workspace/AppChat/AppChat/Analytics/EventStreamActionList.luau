local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_Contexts_0 = l_Enums_0.Contexts;
local v6 = require(script.Parent.EventNames);
return {
    [v6.AppChatVisible] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.AppChatVisible, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            isChatEnabled = v2.identity, 
            isChatLoading = v2.identity, 
            chatLandingListCount = v2.identity
        }
    }, 
    [v6.ChatLandingScreenRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingScreenRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            isChatEnabled = v2.identity
        }
    }, 
    [v6.ChatLandingSearchBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingSearchBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingComposeBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingComposeBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingNotifBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingNotifBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingConversationClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingConversationClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            isFiltered = v2.identity, 
            conversationListCount = v2.identity, 
            selectedConversationId = v2.identity, 
            selectedIndex = v2.identity, 
            hasUnreadMessages = v2.identity
        }
    }, 
    [v6.ChatLandingGroupsBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingGroupsBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {}
    }, 
    [v6.ConversationScreenRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationScreenRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationSendBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationSendBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            sendBtnClickResult = require(script.Parent.Enums).SendButtonClickActionResult
        }
    }, 
    [v6.ConversationScreenExit] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationScreenExit, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            conversationExitType = require(script.Parent.Enums).ConversationExitType
        }
    }, 
    [v6.ConversationInfoBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationInfoBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.NewConversationCreated] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.NewConversationCreated, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            createConversationResult = v2.identity, 
            participantsCount = v2.identity, 
            createdReason = v2.identity
        }
    }, 
    [v6.ChatDetailsRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            participantsCount = v2.identity, 
            isGroupOwner = v2.identity, 
            isGroupConversation = v2.identity
        }
    }, 
    [v6.ConversationMessageSent] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationMessageSent, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            messageSentResult = v2.identity, 
            messageId = v2.identity, 
            recipientIds = v2.identity
        }
    }, 
    [v6.ChatEmptyStateScreenRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatEmptyStateScreenRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            emptyStateType = require(script.Parent.Enums).EmptyStateType
        }
    }, 
    [v6.ChatAddFriendsBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatAddFriendsBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {}
    }
};
