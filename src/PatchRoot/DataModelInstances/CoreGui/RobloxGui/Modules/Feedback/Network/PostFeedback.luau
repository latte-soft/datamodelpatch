local v0 = require(script.Parent.Parent.Parent.InGameMenu.Network.Url);
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_Promise_0 = require(game:GetService("CorePackages").InGameMenuDependencies).Promise;
local function _(v4, v5, v6)
    return l_HttpService_0:RequestInternal(v4):Start(function(v7, v8)
        if not v7 then
            v6((tostring(v8.StatusMessage)));
            return ;
        else
            v5();
            return ;
        end;
    end);
end;
return function(v10, v11, v12, v13, v14, v15)
    local v16 = 1;
    if not (v12 ~= "") or v12 == nil then
        v12 = "UID_" .. game.GameId;
        v16 = 2;
    end;
    local v17 = {
        Url = string.format("%sfeedback-api/v1/feedback/create-localization", v0.APIS_URL), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            LocalizationFeedback = {
                FeedbackTarget = {
                    ServiceSource = {
                        Type = v16, 
                        ExternalId = v12
                    }, 
                    Source = {
                        ContentType = 1, 
                        Value = v10
                    }, 
                    Translation = {
                        ContentType = 1, 
                        Value = v11
                    }
                }, 
                Locale = not l_Players_0.LocalPlayer.LocaleId and "" or l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"), 
                ReasonType = v15, 
                Suggestion = {
                    ContentType = 1, 
                    Value = v13
                }, 
                Comments = v14
            }
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return l_Promise_0.new(function(v18, v19)
        spawn(function()
            local l_v17_0 = v17;
            local l_v18_0 = v18;
            local l_v19_0 = v19;
            local _ = l_HttpService_0:RequestInternal(l_v17_0):Start(function(v23, v24)
                if not v23 then
                    l_v19_0((tostring(v24.StatusMessage)));
                    return ;
                else
                    l_v18_0();
                    return ;
                end;
            end);
        end);
    end);
end;
