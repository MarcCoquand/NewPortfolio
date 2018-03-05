module Main exposing (main)

import Subscriptions.Subscriptions as Subscriptions exposing (..)
import Types.Types as Types exposing (..)
import Update.Update as Update exposing (..)
import View.View as View exposing (..)
import Html exposing (..)
import Update.Typewriter as Typewriter exposing (shorterWaitTime)


initTypewriter : Types.Typewriter
initTypewriter =
    { toShow = ""
    , toWrite = "creating websites."
    , state = WaitingToType
    , toWait = Typewriter.shorterWaitTime
    , statements =
        [ "UX design."
        , "service design."
        , "creating mobile apps."
        ]
    }


init : ( Types.Model, Cmd Msg )
init =
    ( { route = "/"
      , showHeaderImg = False
      , contactFormMessage = ""
      , contactFormName = ""
      , contactFormEmail = ""
      , formSendStatus = NotActive
      , typeWriter = initTypewriter
      }
    , Cmd.none
    )



-- APP


main : Program Never Types.Model Types.Msg
main =
    Html.program
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }
