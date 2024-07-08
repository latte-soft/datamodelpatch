return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)("AddError", function(v0, v1)
    v0 = v0 or {};
    return {
        error = {
            Title = v0.Title, 
            Msg = v0.Msg, 
            Code = v0.Code, 
            timestamp = v1
        }
    };
end);
