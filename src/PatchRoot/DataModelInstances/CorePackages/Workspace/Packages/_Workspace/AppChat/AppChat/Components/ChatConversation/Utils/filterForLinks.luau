local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v5 = require(script.Parent.formatMessages);
local v6 = require(script.Parent.separateLinksFromMessages);
local v7 = require(script.Parent.separateLinksFromMessagesRegex);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagChatGameCardUseUrlLocales);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
return function(v10, v11)
    v3.isType(v10, "table", "filterForLinks.text");
    v3.isType(v11, "table", "filterForLinks.whitelistedDomains");
    if v9() and v10.messageType == v4.System then
        return {
            v10
        };
    elseif not (v10.messageType == v4.Link) or v10.gameLink and v10.gameLink.universeId then
        if not (not v10.content or not v10.content:lower():match("%/games[^%d]*(%d+)/?")) and not v10.moderated then
            if not v8() then
                return v5(v6(v10.content, v11, "%/games[^%d]*(%d+)/?"), v10);
            else
                return v5(v7(v10.content), v10);
            end;
        else
            return {
                v10
            };
        end;
    else
        return {
            v2.Dictionary.join(v10, {
                messageType = v2.None
            })
        };
    end;
end;
