local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Rodux_0 = v0.Rodux;
local l_Cryo_0 = v0.Cryo;
local l_Parent_0 = script.Parent.Parent;
return l_Rodux_0.createReducer({
    dialogOpen = false, 
    reportSentOpen = false, 
    userId = nil, 
    userName = nil
}, {
    [require(l_Parent_0.Actions.OpenReportDialog).name] = function(v4, v5)
        return {
            dialogOpen = true, 
            reportSentOpen = v4.reportSentOpen, 
            userId = v5.userId, 
            userName = v5.userName
        };
    end, 
    [require(l_Parent_0.Actions.SetCurrentPage).name] = function(v6, _)
        return l_Cryo_0.Dictionary.join(v6, {
            dialogOpen = false
        });
    end, 
    [require(l_Parent_0.Actions.CloseReportDialog).name] = function(v8, _)
        return l_Cryo_0.Dictionary.join(v8, {
            dialogOpen = false
        });
    end, 
    [require(l_Parent_0.Actions.OpenReportSentDialog).name] = function(v10, _)
        return l_Cryo_0.Dictionary.join(v10, {
            reportSentOpen = true
        });
    end, 
    [require(l_Parent_0.Actions.CloseReportSentDialog).name] = function(v12, _)
        return l_Cryo_0.Dictionary.join(v12, {
            reportSentOpen = false
        });
    end
});
