local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.PromptType);
return (v1.createReducer({
    promptType = nil, 
    humanoidDescription = nil, 
    rigType = nil, 
    itemId = nil, 
    itemType = nil, 
    itemName = nil, 
    isFavorited = nil, 
    queue = {}, 
    infoQueue = {}
}, {
    [require(l_Parent_0.Actions.CloseOpenPrompt).name] = function(v5, _)
        if not v2.isEmpty(v5.queue) then
            return v2.Dictionary.join(v5.infoQueue[1], {
                promptType = v5.queue[1], 
                queue = v2.List.removeIndex(v5.queue, 1), 
                infoQueue = v2.List.removeIndex(v5.infoQueue, 1)
            });
        else
            return {
                queue = v5.queue, 
                infoQueue = v5.infoQueue
            };
        end;
    end, 
    [require(l_Parent_0.Actions.OpenPrompt).name] = function(v7, v8)
        if v7.promptType == nil then
            return v2.Dictionary.join(v7, {
                promptType = v8.promptType
            }, v8.promptInfo);
        else
            return v2.Dictionary.join(v7, {
                queue = v2.List.join(v7.queue, {
                    v8.promptType
                }), 
                infoQueue = v2.List.join(v7.infoQueue, {
                    v8.promptInfo
                })
            });
        end;
    end, 
    [require(l_Parent_0.Actions.CreateOutfitConfirmed).name] = function(v9, _)
        return v2.Dictionary.join(v9, {
            promptType = v4.EnterOutfitName
        });
    end
}));
