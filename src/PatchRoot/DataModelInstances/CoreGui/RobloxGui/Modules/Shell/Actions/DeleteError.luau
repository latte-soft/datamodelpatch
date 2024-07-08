return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)("DeleteError", function(v0)
    v0 = v0 or {};
    return {
        error = {
            Title = v0.Title, 
            Msg = v0.Msg, 
            Code = v0.Code
        }
    };
end);
