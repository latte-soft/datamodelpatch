local l_Mock_0 = require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).Mock;
return function(v1)
    local v2 = l_Mock_0.MagicMock.new();
    v2.id = v1.title;
    v2.title = v1.title;
    v2.participants = v1.participants or {};
    v2.lastUpdated = {
        GetShortRelativeTime = function()
            return v1.shortRelativeTime or "0";
        end, 
        GetLongRelativeTime = function()
            return v1.longRelativeTime or "0";
        end, 
        GetUnixTimestamp = function()
            return v1.unixTime or 0;
        end
    };
    v2.serverState = "CREATED";
    v2.messages = v1.messages;
    v2.isDefaultTitle = if v1.isDefaultTitle ~= nil then v1.isDefaultTitle else false;
    return v2;
end;
