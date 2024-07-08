local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v6 = require(l_Actions_0.ChatTopBarButtonActivated);
local v7 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local v8 = require(l_script_FirstAncestor_0.Actions.ClientAppLoaded);
local v9 = require(l_script_FirstAncestor_0.Actions.UserInteraction);
local v10 = require(l_Actions_0.IncomingMessageReceived);
local v11 = {
    textDurationUntilFadeout = 30, 
    backgroundDurationUntilFadeout = 3.5, 
    lastGeneralActivityTimestamp = 0, 
    lastMessageActivityTimestamp = 0, 
    isTextBoxFocused = false
};
local function v14(v12)
    local v13 = os.clock();
    return l_Dictionary_0.join(v11, {
        isTextBoxFocused = v12.isTextBoxFocused, 
        lastGeneralActivityTimestamp = v13, 
        lastMessageActivityTimestamp = v13
    });
end;
local function v16(v15)
    return l_Dictionary_0.join(v15, {
        isTextBoxFocused = v15.isTextBoxFocused, 
        lastMessageActivityTimestamp = os.clock()
    });
end;
return v2.createReducer(v11, {
    [v5.name] = function(v17, v18)
        if not v18.enabled then
            return v17;
        else
            return v14(v17);
        end;
    end, 
    [v6.name] = function(v19, v20)
        if not v20.isVisible then
            return v19;
        else
            return v14(v19);
        end;
    end, 
    [v7.name] = function(v21, v22)
        if not v22.enabled then
            return v21;
        else
            return v14(v21);
        end;
    end, 
    [v8.name] = function(v23, _)
        return v14(v23);
    end, 
    [v9.name] = function(v25, v26)
        if v26.interaction == "focus" then
            local l_join_0 = l_Dictionary_0.join;
            local v28 = os.clock();
            return l_join_0(l_Dictionary_0.join(v11, {
                isTextBoxFocused = v25.isTextBoxFocused, 
                lastGeneralActivityTimestamp = v28, 
                lastMessageActivityTimestamp = v28
            }), {
                isTextBoxFocused = true
            });
        elseif v26.interaction == "unfocus" then
            local l_join_1 = l_Dictionary_0.join;
            local v30 = os.clock();
            return l_join_1(l_Dictionary_0.join(v11, {
                isTextBoxFocused = v25.isTextBoxFocused, 
                lastGeneralActivityTimestamp = v30, 
                lastMessageActivityTimestamp = v30
            }), {
                isTextBoxFocused = false
            });
        else
            return v14(v25);
        end;
    end, 
    [v10.name] = function(v31, _)
        return v16(v31);
    end
});
