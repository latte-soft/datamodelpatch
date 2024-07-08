local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_String_0 = v0.String;
local l_getConfig_0 = require(script.Parent.config).getConfig;
return {
    getNodeTestId = function(v4)
        local l_Tags_0 = game:GetService("CollectionService"):GetTags(v4);
        if #l_Tags_0 == 0 then
            return nil;
        else
            local v7 = l_Array_0.filter(l_Tags_0, function(v6)
                return l_String_0.startsWith(v6, l_getConfig_0().testIdAttribute);
            end);
            if #v7 == 0 then
                return nil;
            else
                if #v7 > 1 then
                    error("Instance has multiple TestId tags set");
                end;
                return l_String_0.split(v7[1], l_getConfig_0().testIdAttribute .. "=")[2];
            end;
        end;
    end
};
