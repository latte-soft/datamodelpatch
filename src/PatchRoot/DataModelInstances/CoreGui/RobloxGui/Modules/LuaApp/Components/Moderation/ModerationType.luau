local v0 = require(script.Parent.ModerationState);
return {
    None = v0.None, 
    Warn = v0.Warning, 
    ["Ban 1 Day"] = v0.Banned, 
    ["Ban 3 Days"] = v0.Banned, 
    ["Ban 7 Days"] = v0.Banned, 
    ["Ban 14 Days"] = v0.Banned, 
    ["Ban 6 Months"] = v0.Banned, 
    ["Ban 1 Year"] = v0.Banned, 
    Delete = v0.Deleted
};
