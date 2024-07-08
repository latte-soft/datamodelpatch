local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
return (v2.createReducer({
    promptInfo = {}, 
    queue = {}
}, {
    [require(l_Parent_0.Actions.OpenPublishAssetPrompt).name] = function(v4, v5)
        if v4.promptInfo.promptType == nil then
            return v3.Dictionary.join(v4, {
                promptInfo = v5.promptInfo
            });
        else
            return v3.Dictionary.join(v4, {
                queue = v3.List.join(v4.queue, {
                    v5.promptInfo
                })
            });
        end;
    end, 
    [require(l_Parent_0.Actions.OpenPublishAvatarPrompt).name] = function(v6, v7)
        if v6.promptInfo.promptType == nil then
            return v3.Dictionary.join(v6, {
                promptInfo = v7.promptInfo
            });
        else
            return v3.Dictionary.join(v6, {
                queue = v3.List.join(v6.queue, {
                    v7.promptInfo
                })
            });
        end;
    end, 
    [require(l_Parent_0.Actions.SetHumanoidModel).name] = function(v8, v9)
        return v3.Dictionary.join(v8, {
            promptInfo = v3.Dictionary.join(v8.promptInfo, {
                humanoidModel = v9.humanoidModel
            })
        });
    end, 
    [require(l_Parent_0.Actions.CloseOpenPrompt).name] = function(v10, _)
        if not v3.isEmpty(v10.queue) then
            return v3.Dictionary.join(v10, {
                promptInfo = v10.queue[1], 
                queue = v3.List.removeIndex(v10.queue, 1)
            });
        else
            return {
                promptInfo = {}, 
                queue = v10.queue
            };
        end;
    end, 
    [require(l_Parent_0.Actions.OpenResultModal).name] = function(v12, v13)
        return v3.Dictionary.join(v12, {
            resultModalType = v13.resultType
        });
    end, 
    [require(l_Parent_0.Actions.CloseResultModal).name] = function(v14, _)
        return v3.Dictionary.join(v14, {
            resultModalType = v3.None
        });
    end, 
    [require(l_Parent_0.Actions.OpenValidationErrorModal).name] = function(v16, v17)
        return v3.Dictionary.join(v16, {
            promptInfo = v3.Dictionary.join(v16.promptInfo, {
                errorMessage = v17.errorMessage
            })
        });
    end
}));
