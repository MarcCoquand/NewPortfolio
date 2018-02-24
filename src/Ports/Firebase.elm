port module Ports.Firebase exposing (..)

import Types.Types as Types


port sendContactInfo :
    { contactFormMessage : String
    , contactFormEmail : String
    , contactFormName : String
    }
    -> Cmd msg


port formResult : (Bool -> msg) -> Sub msg
