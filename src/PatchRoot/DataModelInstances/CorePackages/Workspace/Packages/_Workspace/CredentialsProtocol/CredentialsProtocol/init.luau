local v0 = require(script.CredentialsProtocol);
local _ = require(script.CredentialsProtocolTypes);
return {
    CredentialsProtocol = v0, 
    Flags = {
        GetFFlagLuaAppEnableCredentialsProtocol = require(script.Flags.GetFFlagLuaAppEnableCredentialsProtocol), 
        GetFIntLuaAppCredentialsProtocolTimeout = require(script.Flags.GetFIntLuaAppCredentialsProtocolTimeout), 
        GetFIntLuaAppCredentialsProtocolAvailableTimeout = require(script.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout)
    }
};
