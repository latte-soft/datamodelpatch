local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action);
local v1 = {
    "%s(www%.[^%s]+)", 
    "%shttps?://([^%s]+)"
};
return v0(script.Name, function(v2)
    assert(type(v2) == "table", string.format("UpdateSiteMessageBannerText action expects data to be a table, was %s", (type(v2))));
    local v3;
    v3 = v2.LinkUrl and (#v3 == 0 and nil);
    if not (not v2.Text or v3) then
        for _, v5 in ipairs(v1) do
            local v6, _, v8 = string.find(v2.Text, v5);
            if v6 then
                v3 = "https://" .. v8;
            end;
        end;
    end;
    return {
        text = v2.Text, 
        visible = v2.IsVisible or false, 
        link = v3, 
        timestamp = v2.timestamp or nil
    };
end);
