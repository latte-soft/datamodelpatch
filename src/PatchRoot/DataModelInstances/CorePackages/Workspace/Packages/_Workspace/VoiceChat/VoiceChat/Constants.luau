return {
    VOICE_STATE = {
        INACTIVE = "Inactive", 
        TALKING = "Talking", 
        CONNECTING = "Connecting", 
        MUTED = "Muted", 
        LOCAL_MUTED = "LOCAL_MUTED", 
        ERROR = "Error", 
        HIDDEN = "Hidden"
    }, 
    USER_INELIGIBLE_WARNING = "Current Player is not eligible to use Spatial Voice", 
    PLACE_INELIGIBLE_WARNING = "Current place is not eligible for Spatial Voice. Spatial Voice is available for places with Max Players <= 30.", 
    MIN_VOICE_CHAT_API_VERSION = 3, 
    MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = 9, 
    MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = 10, 
    VOICE_CHAT_AVAILABILITY = {
        PlaceNotAvailable = -1, 
        UserNotAvailable = 0, 
        Checking = 1, 
        Available = 2
    }, 
    VOICE_CHAT_DEVICE_TYPE = {
        Input = "Input", 
        Output = "Output"
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
