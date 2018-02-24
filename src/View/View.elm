module View.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types.Types exposing (Model, Msg)
import View.Header as Header exposing (..)
import View.Process as Process exposing (..)
import View.Features as Features exposing (..)
import View.ContactForm as ContactForm exposing (..)
import View.Projects as Projects exposing (..)


view : Model -> Html Msg
view model =
    div [ class "montserrat" ]
        [ Header.header model
        , Features.features model
        , Projects.projects model
        , Process.process model
        , ContactForm.contactForm model
        ]
