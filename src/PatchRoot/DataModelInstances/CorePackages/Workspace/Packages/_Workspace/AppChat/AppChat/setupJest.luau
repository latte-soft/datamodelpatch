local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.JestGlobals);
local l_afterAll_0 = v2.afterAll;
local l_beforeAll_0 = v2.beforeAll;
local l_expect_0 = v2.expect;
local v6 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v7 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v8 = require(l_Parent_0.Dev.CollisionMatchers2D);
l_beforeAll_0(function()
    v6.rodux.GetConversationMetadata.Mock.reply(function()
        return {
            responseBody = {
                global_unread_message_count = 0
            }
        };
    end);
    v7.GetUnreadConversationCount.Mock.reply(function()
        return {
            responseBody = {
                data = {}
            }
        };
    end);
    v7.MarkAsRead.Mock.reply(function()
        return {
            responseBody = {
                data = {}
            }
        };
    end);
    v6.rodux.MarkConversation.Mock.reply(function()
        return {
            responseBody = {
                data = {}
            }
        };
    end);
    l_expect_0.extend(v8.Jest);
end);
l_afterAll_0(function()
    v6.rodux.GetConversationMetadata.Mock.clear();
    v7.GetUnreadConversationCount.Mock.clear();
    v7.MarkAsRead.Mock.clear();
    v6.rodux.MarkConversation.Mock.clear();
end);
