module Types.Types exposing (..)

import Time exposing (..)


type TypingState
    = Showing
    | Erasing
    | Typing
    | WaitingToType


type alias ContactFormInfo =
    { contactFormMessage : String
    , contactFormEmail : String
    , contactFormName : String
    }


type alias Typewriter =
    { toShow : String
    , toWrite : String
    , state : TypingState
    , toWait : Int
    , statements : List String
    }


type SendStatus
    = Fail
    | Ongoing
    | NotActive
    | Successful


type alias Model =
    { route : String
    , showHeaderImg : Bool
    , contactFormMessage : String
    , contactFormEmail : String
    , contactFormName : String
    , formSendStatus : SendStatus
    , typeWriter : Typewriter
    }


type Msg
    = NoOp
    | HeaderImgLoaded Bool
    | ContactFormChange String
    | ContactFormChangeName String
    | ContactFormChangeEmail String
    | SendForm
    | ResetForm
    | SentFormResult Bool
    | TickTypewriter Time
