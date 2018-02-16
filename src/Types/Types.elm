module Types.Types exposing (..)

import Html exposing (..)


type alias Model =
    { route : String
    , showHeaderImg : Bool
    , contactFormMessage : String
    , contactFormEmail : String
    , contactFormName : String
    }


type Msg
    = NoOp
    | HeaderImgLoaded Bool
    | ContactFormChange String
    | ContactFormChangeName String
    | ContactFormChangeEmail String
    | SendForm
    | ResetForm
