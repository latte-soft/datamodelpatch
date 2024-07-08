local v0 = require(script:FindFirstAncestor("ExpChat").Parent.Rodux);
return v0.combineReducers({
    participants = require(script.Parent.participants), 
    participantsMuted = if not game:DefineFastFlag("EasierUnmutingVoiceParticipantsMutedReducer", false) then v0.createReducer({}, {}) else require(script.Parent.participantsMuted), 
    isEnabled = require(script.Parent.isEnabled)
});
