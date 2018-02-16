module Main exposing (..)

import Subscriptions.Subscriptions as Subscriptions exposing (..)
import Types.Types as Types exposing (..)
import Update.Update as Update exposing (..)
import View.View as View exposing (..)
import Html exposing (..)


init : ( Types.Model, Cmd Msg )
init =
    ( { route = "/"
      , showHeaderImg = False
      , contactFormMessage = ""
      , contactFormName = ""
      , contactFormEmail = ""
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
