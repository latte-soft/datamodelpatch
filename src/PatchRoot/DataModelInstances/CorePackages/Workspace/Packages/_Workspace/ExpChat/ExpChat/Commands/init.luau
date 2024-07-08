local v0 = require(script.RBXConsoleCommand);
local v1 = require(script.RBXHelpCommand);
local v2 = require(script.RBXMuteCommand);
local v3 = require(script.RBXUnmuteCommand);
local v4 = require(script.RBXVersionCommand);
local v5 = require(script.RBXEmoteCommand);
local v6 = require(script.RBXTeamCommand);
local v7 = require(script.Whisper.RBXWhisperCommand);
local v8 = require(script.RBXClearCommand);
local v9 = require(script:FindFirstAncestor("ExpChat").Flags.FFlagAllowClearCommand);
local _ = require(script.types);
if not v9() then
    return {
        v0, 
        v1, 
        v2, 
        v3, 
        v4, 
        v5, 
        v6, 
        v7
    };
else
    return {
        v0, 
        v1, 
        v2, 
        v3, 
        v4, 
        v5, 
        v6, 
        v7, 
        v8
    };
end;
