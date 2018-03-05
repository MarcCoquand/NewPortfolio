port module Ports.Firebase exposing (..)

import Types.Types as Types


port sendContactInfo : Types.ContactFormInfo -> Cmd msg


port formResult : (Bool -> msg) -> Sub msg
