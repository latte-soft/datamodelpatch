return {
    MIN_VOICE_CHAT_API_VERSION = 3, 
    VOICE_JOIN_PROGRESS = {
        Idle = "Idle", 
        Joining = "Joining", 
        Suspended = "Suspended", 
        Joined = "Joined", 
        Left = "Left"
    }, 
    MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = 9, 
    MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = 10, 
    VOICE_CHAT_AVAILABILITY = {
        PlaceNotAvailable = -1, 
        UserNotAvailable = 0, 
        Checking = 1, 
        Available = 2
    }, 
    WATCHED_NAMESPACES = {
        VoiceNotifications = true, 
        VoiceModeration = true
    }, 
    WATCHED_MESSAGE_TYPES = {
        "ParticipantModeratedFromVoice", 
        "VoiceToxicityModal", 
        "VoiceToxicityToast"
    }, 
    PERMISSION_STATE = {
        IDLE = "Idle", 
        VOICE_DISABLED = "Voice Disabled", 
        LISTEN_AND_TALK = "Listen and Talk", 
        LISTEN_ONLY = "Listen Only", 
        PENDING_MIC = "Pending Mic"
    }
};
