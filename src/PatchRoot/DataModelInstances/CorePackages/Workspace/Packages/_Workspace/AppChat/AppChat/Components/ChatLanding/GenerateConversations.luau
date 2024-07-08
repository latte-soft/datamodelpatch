local v0 = require(script:FindFirstAncestor("AppChat").Parent.Cryo);
return {
    init = function()
        local function v2(v1)
            return {
                id = v1, 
                title = string.format("default dog chat no. %d", v1), 
                thumbnails = {
                    "rbxassetid://2610133241"
                }, 
                presenceImage = "", 
                messages = {
                    keys = {
                        "messageId"
                    }, 
                    values = {
                        messageId = {
                            content = "a message placeholder \240\159\142\183\240\159\144\155"
                        }
                    }
                }, 
                shortRelativeTime = "now+" .. v1, 
                alias = "(alias)"
            };
        end;
        local v3 = {};
        for v4 = 0, 200 do
            table.insert(v3, (v2(v4)));
        end;
        return {
            getItemList = function()
                return v3;
            end, 
            loadNext = function(v5)
                return v0.List.join(v5, {
                    (v2(v5[#v5].id + 1))
                });
            end, 
            loadPrevious = function(v6)
                return v0.List.join({
                    (v2(v6[1].id - 1))
                }, v6);
            end
        };
    end
};
